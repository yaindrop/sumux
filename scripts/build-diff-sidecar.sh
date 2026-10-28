#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CRATE_DIR="${ROOT}/Native/DiffSidecar"
BINARY_NAME="cmux-diff-sidecar"
BUILD_OUTPUT_DIR="${TARGET_BUILD_DIR:-${CRATE_DIR}/target/cmux-diff-sidecar}"
BUILD_WORK_DIR="${TARGET_TEMP_DIR:-${CRATE_DIR}/target/cmux-diff-sidecar-build}"
CARGO_RUNNER="${ROOT}/scripts/run-diff-sidecar-cargo.sh"
TOOLCHAIN="$(awk -F '"' '/^[[:space:]]*channel[[:space:]]*=/{print $2; exit}' "${CRATE_DIR}/rust-toolchain.toml")"

# Xcode build phases do not inherit a login-shell PATH. Prefer rustup's
# conventional bin directory, then the standard Homebrew prefixes.
export PATH="${CARGO_HOME:-${HOME}/.cargo}/bin:/opt/homebrew/bin:/usr/local/bin:${PATH}"

if ! command -v rustup >/dev/null 2>&1; then
  echo "error: rustup is required to build ${BINARY_NAME}; run ./scripts/setup.sh after installing Rust from https://rustup.rs" >&2
  exit 1
fi

rust_target_for_arch() {
  case "$1" in
    arm64|arm64e) echo "aarch64-apple-darwin" ;;
    x86_64) echo "x86_64-apple-darwin" ;;
    *)
      echo "error: unsupported Rust macOS arch $1" >&2
      return 1
      ;;
  esac
}

ensure_rust_target() {
  local target="$1"
  if ! rustup target list --toolchain "$TOOLCHAIN" --installed | grep -qx "$target"; then
    rustup target add --toolchain "$TOOLCHAIN" "$target"
  fi
}

requested_archs="${CMUX_DIFF_SIDECAR_ARCHS:-${ARCHS:-}}"
if [[ -z "$requested_archs" ]]; then
  case "$(uname -m)" in
    arm64|aarch64) requested_archs="arm64" ;;
    x86_64) requested_archs="x86_64" ;;
    *)
      echo "error: cannot infer Rust macOS target for host arch $(uname -m)" >&2
      exit 1
      ;;
  esac
fi

mkdir -p "$BUILD_OUTPUT_DIR"
mkdir -p "$BUILD_WORK_DIR"
binaries=()
seen_targets=""
for arch in $requested_archs; do
  target="$(rust_target_for_arch "$arch")"
  case " $seen_targets " in
    *" $target "*) continue ;;
  esac
  seen_targets="$seen_targets $target"
  ensure_rust_target "$target"
  target_dir="${BUILD_WORK_DIR}/${target}"
  host_target="$(rustup run "$TOOLCHAIN" rustc -vV | awk '/^host:/{print $2}')"
  # Passing --target equal to the host makes Cargo put proc-macro dylibs in
  # the host dir and then fail to find them. Build natively in that case.
  # macOS bash 3.2 treats an empty "${array[@]}" as unbound under set -u.
  if [[ "$target" == "$host_target" ]]; then
    artifact_dir="${target_dir}"
    env -u SDKROOT -u DEVELOPER_DIR -u TOOLCHAINS -u CC -u CXX -u CFLAGS -u CXXFLAGS -u CPPFLAGS -u LDFLAGS \
      PATH="/usr/bin:/bin:${CARGO_HOME:-$HOME/.cargo}/bin:/opt/homebrew/bin:${PATH}" \
      RUSTC_WRAPPER="${ROOT}/scripts/rustc-strip-provenance.sh" \
      CARGO_TARGET_DIR="$target_dir" \
      MACOSX_DEPLOYMENT_TARGET="${CMUX_DIFF_SIDECAR_MIN_MACOS:-14.0}" \
      "$CARGO_RUNNER" build \
        --manifest-path "${CRATE_DIR}/Cargo.toml" \
        --bin "$BINARY_NAME" \
        --release \
        --locked \
        --jobs 1 \
        --config 'profile.release.lto="off"' \
        --config 'profile.release.strip="none"' \
        --no-default-features
  else
    artifact_dir="${target_dir}/${target}"
    env -u SDKROOT -u DEVELOPER_DIR -u TOOLCHAINS -u CC -u CXX -u CFLAGS -u CXXFLAGS -u CPPFLAGS -u LDFLAGS \
      PATH="/usr/bin:/bin:${CARGO_HOME:-$HOME/.cargo}/bin:/opt/homebrew/bin:${PATH}" \
      RUSTC_WRAPPER="${ROOT}/scripts/rustc-strip-provenance.sh" \
      CARGO_TARGET_DIR="$target_dir" \
      MACOSX_DEPLOYMENT_TARGET="${CMUX_DIFF_SIDECAR_MIN_MACOS:-14.0}" \
      "$CARGO_RUNNER" build \
        --manifest-path "${CRATE_DIR}/Cargo.toml" \
        --bin "$BINARY_NAME" \
        --release \
        --locked \
        --jobs 1 \
        --config 'profile.release.lto="off"' \
        --config 'profile.release.strip="none"' \
        --target "$target" \
        --no-default-features
  fi
  source_binary="${artifact_dir}/release/${BINARY_NAME}"
  [[ -x "$source_binary" ]] || { echo "error: missing ${source_binary}" >&2; exit 1; }
  binaries+=("$source_binary")
done

output_binary="${BUILD_OUTPUT_DIR}/${BINARY_NAME}"
if [[ "${#binaries[@]}" -eq 1 ]]; then
  rsync -a "${binaries[0]}" "$output_binary"
else
  lipo -create -output "$output_binary" "${binaries[@]}"
fi
chmod +x "$output_binary"
# Cargo strip breaks proc-macro dylibs during the build. Strip the finished binary instead.
strip "$output_binary"
"${ROOT}/scripts/verify-diff-sidecar-artifact.sh" "$output_binary" --archs "$requested_archs"

if [[ -z "${TARGET_BUILD_DIR:-}" ]]; then
  echo "built ${output_binary}"
  exit 0
fi

destination_dir="${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/bin"
destination="${destination_dir}/${BINARY_NAME}"
mkdir -p "$destination_dir"
rsync -a "$output_binary" "$destination"
chmod +x "$destination"
if [[ "${CODE_SIGNING_ALLOWED:-YES}" != "NO" && -n "${EXPANDED_CODE_SIGN_IDENTITY:-}" ]]; then
  codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$destination" >/dev/null
fi

#!/bin/bash
# macOS tags files created in this environment with com.apple.provenance.
# rustc then refuses to load proc-macro dylibs and reports E0463.
set -euo pipefail
prev=""
for arg in "$@"; do
  path=""
  if [[ "$prev" == "--extern" ]]; then
    path="${arg#*=}"
  fi
  case "$arg" in
    --extern=*)
      path="${arg#--extern=}"
      path="${path#*=}"
      ;;
  esac
  if [[ -n "$path" && -f "$path" ]]; then
    xattr -c "$path" 2>/dev/null || true
  fi
  prev="$arg"
done
exec "$@"

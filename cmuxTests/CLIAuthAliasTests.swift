import XCTest

extension CLINotifyProcessIntegrationRegressionTests {
    func testTopLevelLoginIsDisabled() throws {
        try assertCloudCommandDisabled(["login"])
    }

    func testTopLevelLogoutIsDisabled() throws {
        try assertCloudCommandDisabled(["logout"])
    }

    private func assertCloudCommandDisabled(_ arguments: [String]) throws {
        let cliPath = try bundledCLIPath()
        var environment = ProcessInfo.processInfo.environment
        environment["CMUX_CLI_SENTRY_DISABLED"] = "1"

        let result = runProcess(
            executablePath: cliPath,
            arguments: arguments,
            environment: environment,
            timeout: 5
        )

        XCTAssertFalse(result.timedOut, result.stderr)
        XCTAssertNotEqual(result.status, 0, result.stdout)
        XCTAssertTrue(
            result.stderr.contains("Cloud services are disabled in this build.")
                || result.stdout.contains("Cloud services are disabled in this build."),
            "stdout=\(result.stdout) stderr=\(result.stderr)"
        )
    }
}

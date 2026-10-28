import CmuxCommandPalette
import AppKit
import Foundation

extension CommandPaletteContextKeys {
    static let proUpgradeEnabled = CommandPaletteContextKeys(rawValue: "pro.upgradeEnabled")
}

extension ContentView {
    static let commandPaletteProUpgradeCommandId = "palette.pro.upgrade"
    static let commandPaletteProWelcomeChecklistCommandId = "palette.pro.welcomeChecklist"

    static func commandPaletteProCommandContributions() -> [CommandPaletteCommandContribution] {
        func constant(_ value: String) -> (CommandPaletteContextSnapshot) -> String {
            { _ in value }
        }

        _ = constant
        return []
    }

    func registerProCommandHandlers(_ registry: inout CommandPaletteHandlerRegistry) {
        _ = registry
    }
}

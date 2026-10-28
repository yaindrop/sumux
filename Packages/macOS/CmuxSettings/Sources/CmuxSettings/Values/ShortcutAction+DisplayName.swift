import Foundation

extension ShortcutAction {
    /// User-facing display name shown in the Settings UI.
    public var displayName: String {
        switch self {
        case .openSettings: return String(localized: "shortcut.display.openSettings", defaultValue: "Settings…")
        case .reloadConfiguration: return String(localized: "shortcut.display.reloadConfiguration", defaultValue: "Reload Configuration")
        case .showHideAllWindows: return String(localized: "shortcut.display.showHideAllWindows", defaultValue: "Show/Hide All Windows")
        case .globalSearch: return String(localized: "shortcut.display.globalSearch", defaultValue: "Global Search")
        case .newWindow: return String(localized: "shortcut.display.newWindow", defaultValue: "New Window")
        case .closeWindow: return String(localized: "shortcut.display.closeWindow", defaultValue: "Close Window")
        case .toggleFullScreen: return String(localized: "shortcut.display.toggleFullScreen", defaultValue: "Toggle Full Screen")
        case .quit: return String(localized: "shortcut.display.quit", defaultValue: "Quit cmux")
        case .toggleSidebar: return String(localized: "shortcut.display.toggleSidebar", defaultValue: "Toggle Left Sidebar")
        case .newTab: return String(localized: "shortcut.display.newTab", defaultValue: "New Workspace")
        case .newBrowserWorkspace:
            return String(localized: "shortcut.newBrowserWorkspace.label", defaultValue: "New Browser Workspace")
        case .saveLayoutTemplate:
            return String(localized: "shortcut.saveLayoutTemplate.label", defaultValue: "Save Layout as Template…")
        case .openFolder: return String(localized: "shortcut.display.openFolder", defaultValue: "Open Folder")
        case .reopenPreviousSession: return String(localized: "shortcut.display.reopenPreviousSession", defaultValue: "Restore Previous App Launch")
        case .goToWorkspace: return String(localized: "shortcut.display.goToWorkspace", defaultValue: "Go to Workspace…")
        case .commandPalette: return String(localized: "shortcut.display.commandPalette", defaultValue: "Command Palette…")
        case .commandPaletteNext: return String(localized: "shortcut.display.commandPaletteNext", defaultValue: "Command Palette: Next")
        case .commandPalettePrevious: return String(localized: "shortcut.display.commandPalettePrevious", defaultValue: "Command Palette: Previous")
        case .sendFeedback: return String(localized: "shortcut.display.sendFeedback", defaultValue: "Send Feedback")
        case .showNotifications: return String(localized: "shortcut.display.showNotifications", defaultValue: "Show Notifications")
        case .jumpToUnread: return String(localized: "shortcut.display.jumpToUnread", defaultValue: "Jump to Latest Unread")
        case .toggleUnread: return String(localized: "shortcut.display.toggleUnread", defaultValue: "Toggle Unread")
        case .markOldestUnreadAndJumpNext: return String(localized: "shortcut.display.markOldestUnreadAndJumpNext", defaultValue: "Mark as Oldest Unread and Jump to Next Latest Unread")
        case .focusRightSidebar: return String(localized: "shortcut.display.focusRightSidebar", defaultValue: "Toggle Right Sidebar Focus")
        case .switchRightSidebarToFiles: return String(localized: "shortcut.display.switchRightSidebarToFiles", defaultValue: "Show Sidebar Files")
        case .switchRightSidebarToFind: return String(localized: "shortcut.display.switchRightSidebarToFind", defaultValue: "Show Sidebar Find")
        case .switchRightSidebarToSessions: return String(localized: "shortcut.display.switchRightSidebarToSessions", defaultValue: "Show Sidebar Vault")
        case .switchRightSidebarToFeed: return String(localized: "shortcut.display.switchRightSidebarToFeed", defaultValue: "Show Sidebar Feed")
        case .switchRightSidebarToDock: return String(localized: "shortcut.display.switchRightSidebarToDock", defaultValue: "Show Sidebar Dock")
        case .triggerFlash: return String(localized: "shortcut.display.triggerFlash", defaultValue: "Flash Focused Panel")
        case .nextSurface: return String(localized: "shortcut.display.nextSurface", defaultValue: "Next Surface")
        case .prevSurface: return String(localized: "shortcut.display.prevSurface", defaultValue: "Previous Surface")
        case .moveSurfaceLeft: return String(localized: "shortcut.moveSurfaceLeft.label", defaultValue: "Reorder Surface Left")
        case .moveSurfaceRight: return String(localized: "shortcut.moveSurfaceRight.label", defaultValue: "Reorder Surface Right")
        case .moveSurfaceToPreviousPane:
            return String(localized: "shortcut.moveSurfaceToPreviousPane.label", defaultValue: "Move Surface to Previous Pane")
        case .moveSurfaceToNextPane:
            return String(localized: "shortcut.moveSurfaceToNextPane.label", defaultValue: "Move Surface to Next Pane")
        case .moveSurfaceToPaneLeft:
            return String(localized: "shortcut.moveSurfaceToPaneLeft.label", defaultValue: "Move Surface to Pane on Left")
        case .moveSurfaceToPaneRight:
            return String(localized: "shortcut.moveSurfaceToPaneRight.label", defaultValue: "Move Surface to Pane on Right")
        case .moveSurfaceToPaneUp:
            return String(localized: "shortcut.moveSurfaceToPaneUp.label", defaultValue: "Move Surface to Pane Above")
        case .moveSurfaceToPaneDown:
            return String(localized: "shortcut.moveSurfaceToPaneDown.label", defaultValue: "Move Surface to Pane Below")
        case .selectSurfaceByNumber: return String(localized: "shortcut.display.selectSurfaceByNumber", defaultValue: "Select Surface 1…9")
        case .nextSidebarTab: return String(localized: "shortcut.display.nextSidebarTab", defaultValue: "Next Workspace")
        case .prevSidebarTab: return String(localized: "shortcut.display.prevSidebarTab", defaultValue: "Previous Workspace")
        case .moveWorkspaceUp: return String(localized: "shortcut.moveWorkspaceUp.label", defaultValue: "Move Workspace Up")
        case .moveWorkspaceDown: return String(localized: "shortcut.moveWorkspaceDown.label", defaultValue: "Move Workspace Down")
        case .focusHistoryBack: return String(localized: "shortcut.display.focusHistoryBack", defaultValue: "Focus Back")
        case .focusHistoryForward: return String(localized: "shortcut.display.focusHistoryForward", defaultValue: "Focus Forward")
        case .selectWorkspaceByNumber: return String(localized: "shortcut.display.selectWorkspaceByNumber", defaultValue: "Select Workspace 1…9")
        case .renameTab: return String(localized: "shortcut.display.renameTab", defaultValue: "Rename Tab")
        case .renameWorkspace: return String(localized: "shortcut.display.renameWorkspace", defaultValue: "Rename Workspace")
        case .editWorkspaceDescription: return String(localized: "shortcut.display.editWorkspaceDescription", defaultValue: "Edit Workspace Description")
        case .markWorkspaceDone: return String(localized: "shortcut.markWorkspaceDone.label", defaultValue: "Mark Workspace as Done")
        case .cycleWorkspaceStatus: return String(localized: "shortcut.cycleWorkspaceStatus.label", defaultValue: "Cycle Workspace Status")
        case .toggleChecklistItemComplete: return String(localized: "shortcut.toggleChecklistItemComplete.label", defaultValue: "Toggle Checklist Item Complete")
        case .closeTab: return String(localized: "shortcut.display.closeTab", defaultValue: "Close Tab")
        case .closeOtherTabsInPane: return String(localized: "shortcut.display.closeOtherTabsInPane", defaultValue: "Close Other Tabs in Pane")
        case .closeWorkspace: return String(localized: "shortcut.display.closeWorkspace", defaultValue: "Close Workspace")
        case .newWorkspaceGroup:
            return String(localized: "shortcut.newWorkspaceGroup.label", defaultValue: "New Workspace Group")
        case .groupSelectedWorkspaces:
            return String(localized: "shortcut.groupSelectedWorkspaces.label", defaultValue: "Group Selected Workspaces")
        case .toggleFocusedWorkspaceGroupCollapsed:
            return String(localized: "shortcut.toggleFocusedWorkspaceGroupCollapsed.label", defaultValue: "Toggle Focused Workspace's Group Collapse")
        case .reopenClosedWorkspace:
            return String(localized: "menu.history.reopenClosedWorkspace", defaultValue: "Reopen Closed Workspace")
        case .reopenClosedBrowserPanel:
            return String(localized: "menu.history.reopenLastClosed", defaultValue: "Reopen Last Closed")
        case .newSurface: return String(localized: "shortcut.display.newSurface", defaultValue: "New Surface")
        case .toggleTerminalCopyMode: return String(localized: "shortcut.display.toggleTerminalCopyMode", defaultValue: "Toggle Terminal Copy Mode")
        case .focusTextBoxInput: return String(localized: "shortcut.display.focusTextBoxInput", defaultValue: "Focus TextBox Input")
        case .cycleTextBoxSubmitAction:
            return String(localized: "shortcut.cycleTextBoxSubmitAction.label", defaultValue: "Cycle TextBox Submit Action")
        case .attachTextBoxFile: return String(localized: "shortcut.display.attachTextBoxFile", defaultValue: "Attach File to TextBox Input")
        case .sendCtrlFToTerminal:
            return String(localized: "shortcut.sendCtrlFToTerminal.label", defaultValue: "Send Ctrl-F to Terminal")
        case .clearScreenKeepScrollback:
            return String(localized: "shortcut.clearScreenKeepScrollback.label", defaultValue: "Clear Screen (Keep Scrollback)")
        case .focusLeft: return String(localized: "shortcut.display.focusLeft", defaultValue: "Focus Pane Left")
        case .focusRight: return String(localized: "shortcut.display.focusRight", defaultValue: "Focus Pane Right")
        case .focusUp: return String(localized: "shortcut.display.focusUp", defaultValue: "Focus Pane Up")
        case .focusDown: return String(localized: "shortcut.display.focusDown", defaultValue: "Focus Pane Down")
        case .focusPreviousPane:
            return String(localized: "shortcut.focusPreviousPane.label", defaultValue: "Focus Previous Pane")
        case .focusNextPane:
            return String(localized: "shortcut.focusNextPane.label", defaultValue: "Focus Next Pane")
        case .splitRight: return String(localized: "shortcut.display.splitRight", defaultValue: "Split Right")
        case .splitDown: return String(localized: "shortcut.display.splitDown", defaultValue: "Split Down")
        case .toggleSplitZoom: return String(localized: "shortcut.display.toggleSplitZoom", defaultValue: "Toggle Pane Zoom")
        case .increaseWorkspaceTerminalFontSize:
            return String(
                localized: "shortcut.increaseWorkspaceTerminalFontSize.label",
                defaultValue: "Increase Font Size for Workspace Terminals"
            )
        case .decreaseWorkspaceTerminalFontSize:
            return String(
                localized: "shortcut.decreaseWorkspaceTerminalFontSize.label",
                defaultValue: "Decrease Font Size for Workspace Terminals"
            )
        case .resetWorkspaceTerminalFontSize:
            return String(
                localized: "shortcut.resetWorkspaceTerminalFontSize.label",
                defaultValue: "Reset Font Size for Workspace Terminals"
            )
        case .equalizeSplits: return String(localized: "shortcut.display.equalizeSplits", defaultValue: "Equalize Splits")
        case .splitBrowserRight: return String(localized: "shortcut.display.splitBrowserRight", defaultValue: "Split Browser Right")
        case .splitBrowserDown: return String(localized: "shortcut.display.splitBrowserDown", defaultValue: "Split Browser Down")
        case .toggleRightSidebar: return String(localized: "shortcut.display.toggleRightSidebar", defaultValue: "Toggle Right Sidebar")
        case .fileExplorerOpenSelection:
            return String(localized: "shortcut.fileExplorerOpenSelection.label", defaultValue: "File Explorer: Open Selection")
        case .fileExplorerOpenSelectionFinderAlias:
            return String(localized: "shortcut.fileExplorerOpenSelectionFinderAlias.label", defaultValue: "File Explorer: Open Selection (Finder Alias)")
        case .toggleCanvasLayout:
            return String(localized: "shortcut.toggleCanvasLayout.label", defaultValue: "Toggle Canvas Layout")
        case .canvasRevealFocusedPane:
            return String(localized: "shortcut.canvasRevealFocusedPane.label", defaultValue: "Canvas: Reveal Focused Pane")
        case .canvasOverview:
            return String(localized: "shortcut.canvasOverview.label", defaultValue: "Canvas: Toggle Overview")
        case .canvasZoomIn:
            return String(localized: "shortcut.canvasZoomIn.label", defaultValue: "Canvas: Zoom In")
        case .canvasZoomOut:
            return String(localized: "shortcut.canvasZoomOut.label", defaultValue: "Canvas: Zoom Out")
        case .canvasZoomReset:
            return String(localized: "shortcut.canvasZoomReset.label", defaultValue: "Canvas: Actual Size")
        case .canvasTidy:
            return String(localized: "shortcut.canvasTidy.label", defaultValue: "Canvas: Tidy Panes")
        case .canvasAlignLeft:
            return String(localized: "shortcut.canvasAlignLeft.label", defaultValue: "Canvas: Align Left Edges")
        case .canvasAlignRight:
            return String(localized: "shortcut.canvasAlignRight.label", defaultValue: "Canvas: Align Right Edges")
        case .canvasAlignTop:
            return String(localized: "shortcut.canvasAlignTop.label", defaultValue: "Canvas: Align Top Edges")
        case .canvasAlignBottom:
            return String(localized: "shortcut.canvasAlignBottom.label", defaultValue: "Canvas: Align Bottom Edges")
        case .canvasEqualizeWidths:
            return String(localized: "shortcut.canvasEqualizeWidths.label", defaultValue: "Canvas: Equalize Widths")
        case .canvasEqualizeHeights:
            return String(localized: "shortcut.canvasEqualizeHeights.label", defaultValue: "Canvas: Equalize Heights")
        case .canvasDistributeHorizontally:
            return String(localized: "shortcut.canvasDistributeHorizontally.label", defaultValue: "Canvas: Distribute Horizontally")
        case .canvasDistributeVertically:
            return String(localized: "shortcut.canvasDistributeVertically.label", defaultValue: "Canvas: Distribute Vertically")
        case .openDiffViewer: return String(localized: "shortcut.display.openDiffViewer", defaultValue: "Open Diff Viewer")
        case .saveFilePreview: return String(localized: "shortcut.display.saveFilePreview", defaultValue: "Save File Preview")
        case .openBrowser: return String(localized: "shortcut.display.openBrowser", defaultValue: "Open Browser")
        case .focusBrowserAddressBar: return String(localized: "shortcut.display.focusBrowserAddressBar", defaultValue: "Focus Address Bar")
        case .browserBack: return String(localized: "shortcut.display.browserBack", defaultValue: "Back")
        case .browserForward: return String(localized: "shortcut.display.browserForward", defaultValue: "Forward")
        case .browserReload: return String(localized: "shortcut.display.browserReload", defaultValue: "Reload Page")
        case .browserHardReload: return String(localized: "menu.view.hardRefresh", defaultValue: "Hard Refresh")
        case .browserZoomIn: return String(localized: "shortcut.display.browserZoomIn", defaultValue: "Zoom In")
        case .browserZoomOut: return String(localized: "shortcut.display.browserZoomOut", defaultValue: "Zoom Out")
        case .browserZoomReset: return String(localized: "shortcut.display.browserZoomReset", defaultValue: "Actual Size")
        case .markdownZoomIn: return String(localized: "shortcut.display.markdownZoomIn", defaultValue: "Markdown Viewer: Zoom In")
        case .markdownZoomOut: return String(localized: "shortcut.display.markdownZoomOut", defaultValue: "Markdown Viewer: Zoom Out")
        case .markdownZoomReset: return String(localized: "shortcut.display.markdownZoomReset", defaultValue: "Markdown Viewer: Actual Size")
        case .find: return String(localized: "shortcut.display.find", defaultValue: "Find…")
        case .findInDirectory: return String(localized: "shortcut.display.findInDirectory", defaultValue: "Find in Directory…")
        case .findNext: return String(localized: "shortcut.display.findNext", defaultValue: "Find Next")
        case .findPrevious: return String(localized: "shortcut.display.findPrevious", defaultValue: "Find Previous")
        case .hideFind: return String(localized: "shortcut.display.hideFind", defaultValue: "Hide Find Bar")
        case .useSelectionForFind: return String(localized: "shortcut.display.useSelectionForFind", defaultValue: "Use Selection for Find")
        case .toggleBrowserDeveloperTools: return String(localized: "shortcut.display.toggleBrowserDeveloperTools", defaultValue: "Toggle Browser Developer Tools")
        case .showBrowserJavaScriptConsole: return String(localized: "shortcut.display.showBrowserJavaScriptConsole", defaultValue: "Show Browser JavaScript Console")
        case .toggleBrowserFocusMode: return String(localized: "shortcut.display.toggleBrowserFocusMode", defaultValue: "Enter Browser Focus Mode")
        case .toggleBrowserDesignMode: return String(localized: "shortcut.toggleBrowserDesignMode.label", defaultValue: "Toggle Browser Design Mode")
        case .toggleReactGrab: return String(localized: "shortcut.display.toggleReactGrab", defaultValue: "Toggle React Grab")
        case .diffViewerScrollDown:
            return String(localized: "shortcut.diffViewerScrollDown.label", defaultValue: "Viewers: Scroll Down")
        case .diffViewerScrollUp:
            return String(localized: "shortcut.diffViewerScrollUp.label", defaultValue: "Viewers: Scroll Up")
        case .diffViewerScrollHalfPageDown:
            return String(localized: "shortcut.diffViewerScrollHalfPageDown.label", defaultValue: "Viewers: Scroll Half Page Down")
        case .diffViewerScrollHalfPageUp:
            return String(localized: "shortcut.diffViewerScrollHalfPageUp.label", defaultValue: "Viewers: Scroll Half Page Up")
        case .diffViewerScrollDownEmacs:
            return String(localized: "shortcut.diffViewerScrollDownEmacs.label", defaultValue: "Viewers: Scroll Down (Emacs)")
        case .diffViewerScrollUpEmacs:
            return String(localized: "shortcut.diffViewerScrollUpEmacs.label", defaultValue: "Viewers: Scroll Up (Emacs)")
        case .diffViewerScrollToBottom:
            return String(localized: "shortcut.diffViewerScrollToBottom.label", defaultValue: "Viewers: Scroll to Bottom")
        case .diffViewerScrollToTop:
            return String(localized: "shortcut.diffViewerScrollToTop.label", defaultValue: "Viewers: Scroll to Top")
        case .diffViewerOpenFileSearch:
            return String(localized: "shortcut.diffViewerOpenFileSearch.label", defaultValue: "Diff Viewer: Open File Search")
        case .diffViewerNextFile:
            return String(localized: "shortcut.diffViewerNextFile.label", defaultValue: "Diff Viewer: Next File")
        case .diffViewerPreviousFile:
            return String(localized: "shortcut.diffViewerPreviousFile.label", defaultValue: "Diff Viewer: Previous File")
        case .simulatorHome:
            return String(localized: "shortcut.simulatorHome.label", defaultValue: "Simulator: Home")
        case .simulatorRotateLeft:
            return String(localized: "shortcut.simulatorRotateLeft.label", defaultValue: "Simulator: Rotate Left")
        case .simulatorRotateRight:
            return String(localized: "shortcut.simulatorRotateRight.label", defaultValue: "Simulator: Rotate Right")
        case .simulatorToggleAppearance:
            return String(localized: "shortcut.simulatorToggleAppearance.label", defaultValue: "Simulator: Toggle Appearance")
        case .simulatorToggleSoftwareKeyboard:
            return String(localized: "shortcut.simulatorToggleSoftwareKeyboard.label", defaultValue: "Simulator: Toggle Software Keyboard")
        }
    }
}

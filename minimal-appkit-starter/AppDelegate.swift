//
//  AppDelegate.swift
//  minimal-appkit-starter
//
//  Created by qiyang on 2026/8/23.
//

import Cocoa

@main
final class AppDelegate: NSObject, NSApplicationDelegate {

    private var window: NSWindow!

    // Without a storyboard, the synthesized @main only calls NSApplicationMain,
    // so we must create the app, assign the delegate, and run it ourselves.
    static func main() {
        let app = NSApplication.shared
        let delegate = AppDelegate()
        app.delegate = delegate
        app.run()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        buildMenu()
        buildWindow()
    }

    func applicationShouldTerminateAfterLastWindowClosed(
        _ sender: NSApplication
    ) -> Bool {
        true
    }

    private func buildWindow() {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 720, height: 480),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.contentViewController = SplitViewController()
        window.title = "minimal-appkit-starter"
        window.center()
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    private func buildMenu() {
        let appMenuItem = NSMenuItem()
        let appMenu = NSMenu()
        appMenu.addItem(
            withTitle: "Quit minimal-appkit-starter",
            action: #selector(NSApplication.terminate(_:)),
            keyEquivalent: "q"
        )
        appMenuItem.submenu = appMenu

        let mainMenu = NSMenu()
        mainMenu.addItem(appMenuItem)
        NSApp.mainMenu = mainMenu
    }
}

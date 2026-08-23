# minimal-appkit-starter

The smallest macOS AppKit app that opens a window — everything in one Swift
file, no storyboard, no nibs, no asset catalogs.

## What you get

Two small Swift files, no storyboard:

- wires up `NSApplication` and the app delegate programmatically
- opens a centered, standard titled window rooted in an `NSSplitViewController`
  with three columns: source-list sidebar, message list, and detail pane
- includes a window toolbar with a leading sidebar toggle button
  (hide/show the sidebar, like Mail or Finder)
- provides a minimal menu (Quit, ⌘Q)
- terminates when the last window closes

## Requirements

- macOS 26 (Xcode 27) or later
- Swift 5

## Build & run

```sh
xcodebuild -project minimal-appkit-starter.xcodeproj \
           -scheme minimal-appkit-starter \
           -configuration Debug build

open "$(xcodebuild -project minimal-appkit-starter.xcodeproj \
                   -scheme minimal-appkit-starter \
                   -configuration Debug \
                   -showBuildSettings | awk '/BUILT_PRODUCTS_DIR/{print $3}')/minimal-appkit-starter.app"
```

Or simply open the project in Xcode and press ⌘R.

## Project layout

```
minimal-appkit-starter/
├── AppDelegate.swift          # @main entry point, window, menu
└── SplitViewController.swift  # root split view: three columns (sidebar, list, detail)
minimal-appkit-starter.xcodeproj/ # build settings only (no storyboard)
```

## License

[MIT](LICENSE)
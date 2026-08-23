# Contributing

Thanks for taking the time to contribute!

## Getting started

- Fork the repository and create a feature branch.
- Keep changes focused: this project is intentionally *minimal* — one app file,
  no storyboard. Avoid adding layers unless they earn their place.
- Follow the existing style (4-space indent, explicit over implicit).

## Building

```sh
xcodebuild -project minimal-appkit-starter.xcodeproj \
           -scheme minimal-appkit-starter \
           -configuration Debug build
```

## Submitting changes

1. Make sure the app builds and opens a window.
2. Open a pull request with a clear description of the change and why it's
   needed.
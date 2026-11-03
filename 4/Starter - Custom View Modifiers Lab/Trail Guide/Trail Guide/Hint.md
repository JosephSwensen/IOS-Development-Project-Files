# Hints

Try each step on your own first. Come here when you are stuck.

## Where do I put my modifiers?

Make a new Swift file named `Modifiers.swift` (File > New > File from Template > Swift File). Put every `ViewModifier` struct and the `View` extension in that file. Add `import SwiftUI` at the top.

## The shape of a modifier with a parameter

Here is the outline of `PillStyle`. The chain is up to you. Copy it from one of the pills in `TrailListScreen`, then swap the color for the `color` property.

```swift
struct PillStyle: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            // the pill's chain goes here
            // use `color` where the chain sets the background
    }
}

extension View {
    func pillStyle(color: Color) -> some View {
        modifier(PillStyle(color: color))
    }
}
```

## Giving a parameter a default value

The default goes on the extension's function, not on the struct:

```swift
func panelStyle(tint: Color = .green) -> some View {
    modifier(PanelStyle(tint: tint))
}
```

Now `.panelStyle()` gives you green, and `.panelStyle(tint: .orange)` gives you orange.

## My modifier won't show up after the dot

Check that your function is inside `extension View { }`, and that it returns `some View`.

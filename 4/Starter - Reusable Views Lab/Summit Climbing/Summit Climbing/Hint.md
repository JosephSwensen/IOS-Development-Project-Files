# Hints

Try each step on your own first. Come here when you are stuck.

## Where do my new views go?

Make a new Swift file for each one (File > New > File from Template > Swift File). Add `import SwiftUI` at the top.

## The shape of ActionRow

The `HStack` inside the label is up to you. Copy it from one of the buttons in `HomeScreen`, then swap the icon and the title for the properties.

```swift
struct ActionRow: View {
    let title: String
    var systemImage: String = "arrow.right.circle"
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            // the row's HStack goes here
            // use `systemImage` and `title` instead of the fixed values
        }
        .buttonStyle(.plain)
    }
}
```

Put `action` last. That's what lets you pass it as a trailing closure.

## The shape of GymCard

```swift
struct GymCard<Content: View>: View {
    let title: String
    let systemImage: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // the card's Label goes here
            content()
        }
        // the card's chain of modifiers goes here
    }
}
```

## Xcode says it can't infer Content

Check that you call `content()` with parentheses in `body`. `content` is a closure, so you have to run it to get the views.

## My card only shows one view, or shows an error

Check that `@ViewBuilder` is in front of `let content`.

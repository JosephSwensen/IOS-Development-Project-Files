# Hints

Try each step on your own first. Come here when you are stuck.

## Gestures 1

### The double tap never runs

When a view has a single tap and a double tap, the order matters. The first tap gesture that matches wins. Put `.onTapGesture(count: 2)` above `.onTapGesture`:

```swift
.onTapGesture(count: 2) {
    // double tap
}
.onTapGesture {
    // single tap
}
```

### Reacting while the finger is down

`onPressingChanged:` is a second closure after the long press action. It gets a `Bool` that is `true` when the press starts and `false` when it ends:

```swift
.onLongPressGesture(minimumDuration: 1) {
    // runs after a 1 second hold
} onPressingChanged: { pressing in
    isPressing = pressing
}
```

### The empty part of the row doesn't respond

A tap only counts where the view draws something. A `Spacer` draws nothing. Add `.contentShape(.rect)` to the `HStack`, above `.onTapGesture`.

## Gestures 2

### Showing the saved spot plus the drag

`.offset` can take an `x` and a `y`. Add the two sizes together, one part at a time:

```swift
.offset(x: note.offset.width + dragOffset.width,
        y: note.offset.height + dragOffset.height)
```

### Writing .updating

The closure gets three values. You only need the first two. Set `state` to the new value:

```swift
.updating($dragOffset) { value, state, _ in
    state = value.translation
}
```

### The note slides under the other notes

Add `.zIndex(dragOffset == .zero ? 0 : 1)` to the card. A higher `zIndex` draws the view on top.

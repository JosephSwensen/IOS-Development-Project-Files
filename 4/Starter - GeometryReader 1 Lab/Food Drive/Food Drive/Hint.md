# Hints

Try each step on your own first. Come here when you are stuck.

## Where does the GeometryReader go?

Around the whole `VStack`, with `.padding()` on the reader instead of on the `VStack`:

```swift
var body: some View {
    GeometryReader { geometry in
        VStack(alignment: .leading, spacing: 24) {
            // everything that was already here
        }
    }
    .padding()
}
```

With the padding on the outside, `geometry.size.width` is the width inside the padding. That's the space your views have to fit in.

## The progress bar

Use `geometry.size.width` everywhere the bar used `300`. The green bar is `geometry.size.width * progress`.

## The tiles

Two tiles sit side by side with `16` points of spacing between them. Take the spacing out first, then split what's left in half:

```swift
.frame(width: (geometry.size.width - 16) / 2)
```

## The class row grew huge

That's the point of that step. A `GeometryReader` takes all the space it's offered. Put `.frame(height: 20)` back on the reader.

## The bar in the class row is the wrong width

`geometry` there is the inner reader, not the outer one. It measures the space beside the label, which is what you want.

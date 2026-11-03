# Hints

Try each step on your own first. Come here when you are stuck.

## MVVM 2

### Writing a computed property on the ViewModel

A computed property works the same way in a class as it does in a struct. It has no stored value. It runs its code every time something reads it.

```swift
var finishedBooks: [Book] {
    books.filter { $0.isFinished }
}
```

Once `finishedBooks` exists, the other properties can use it instead of writing the filter again:

```swift
var booksFinishedCount: Int {
    finishedBooks.count
}
```

### Finding the right book in `markFinished(_:)`

The `Finish` button in the starter already finds the book's spot in the array. You can move that code into the function almost as it is:

```swift
func markFinished(_ book: Book) {
    if let index = books.firstIndex(where: { $0.id == book.id }) {
        books[index].isFinished = true
    }
}
```

### My view doesn't redraw

Check that `ReadingLogViewModel` is marked `@Observable`, and that the view holds it with `@State private var viewModel = ReadingLogViewModel()`.

## MVVM 3

### Checking for a duplicate title

`contains(where:)` returns `true` if any item in the array passes the test:

```swift
let isDuplicate = books.contains(where: { $0.title.lowercased() == title.lowercased() })
```

`lowercased()` makes "holes" and "Holes" count as the same title.

### Passing bindings to `NewBookFields`

The parent still owns the values. Pass them in with `$`:

```swift
NewBookFields(title: $newTitle, author: $newAuthor, pageCount: $newPageCount)
```

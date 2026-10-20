/*:
## Exercise - Building a Queue

 A struct can have a type parameter too. A queue is a list where you add at the back and remove from the front. The first item added is the first item removed.

 Write a struct called `Queue` with one type parameter called `Element`. Give it a `private var items: [Element]` that starts empty, and these members:

 - `mutating func enqueue(_ item: Element)` adds an item to the back.
 - `mutating func dequeue() -> Element?` removes the front item and returns it, or returns `nil` when the queue is empty.
 - `func peek() -> Element?` returns the front item without removing it.
 - `var count: Int` is a computed property that returns how many items are in the queue.

 (Hint: check `items.isEmpty` before calling `items.removeFirst()`, because `removeFirst()` crashes on an empty array.)
 */





//:  Create a `Queue<Int>` called `numberQueue` and enqueue `1`, `2` and `3`.





//:  Before you go on, write two things in a comment: the order the three numbers will come out of `numberQueue`, and the order they would come out of a stack. Then dequeue all three and print each one, and check your prediction. (Hint: `dequeue()` returns an optional, so print it with `?? 0`.)


// Prediction:


//:  Try to enqueue the string `"four"` onto `numberQueue`. Read the error, then delete that line. In a comment, explain what the error is telling you.


// Answer:


/*:
 An extension can add a method to a generic type. A `where` clause on the extension limits it to some types.

 Write `extension Queue where Element: Equatable`. Add a method called `contains(_:)` that takes an `Element` and returns `true` when the queue holds that item, or `false` when it doesn't. (Hint: the extension is in the same file as `Queue`, so it can read `items`.)
 */





//:  Create a `Queue<String>` of three names, including `"Cal"`. Print whether it contains `"Cal"`, then whether it contains a name you didn't add.





//:  Here is a struct that isn't `Equatable`. Create a `Queue<Song>`, enqueue a song, and try calling `contains(_:)` on it. Read the error. Then make `Song` conform to `Equatable` and run it again. In a comment, explain why the error went away.


struct Song {
    let title: String
    let artist: String
}

// Answer:


/*:
 [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Order Line](@next)
 */

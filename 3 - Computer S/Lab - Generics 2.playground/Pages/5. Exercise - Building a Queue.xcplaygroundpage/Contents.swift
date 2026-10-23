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
struct Queue<Element> {
    private var items: [Element] = []
    
    mutating func enqueue(_ item: Element) {
        items.append(item)
    }
    
    mutating func dequeue() -> Element? {
        if items.isEmpty {
            return nil
        }
        var removedItem = items.removeFirst()
        return removedItem
    }
    
    func peek() -> Element? {
        return items.first
    }
    
    var count: Int {
        return items.count
    }
}




//:  Create a `Queue<Int>` called `numberQueue` and enqueue `1`, `2` and `3`.
var numberQueue = Queue<Int>()
numberQueue.enqueue(1)
numberQueue.enqueue(2)
numberQueue.enqueue(3)


//:  Before you go on, write two things in a comment: the order the three numbers will come out of `numberQueue`, and the order they would come out of a stack. Then dequeue all three and print each one, and check your prediction. (Hint: `dequeue()` returns an optional, so print it with `?? 0`.)


// Prediction: they would go 1 2 3 and in a stack they would go 3 2 1
print(numberQueue.dequeue() ?? 0)
print(numberQueue.dequeue() ?? 0)
print(numberQueue.dequeue() ?? 0)
//:  Try to enqueue the string `"four"` onto `numberQueue`. Read the error, then delete that line. In a comment, explain what the error is telling you.


// Answer: its telling me that I cant call a function with a string with it is expecting a Int because they is how i set up the function is with a Int not a String


/*:
 An extension can add a method to a generic type. A `where` clause on the extension limits it to some types.

 Write `extension Queue where Element: Equatable`. Add a method called `contains(_:)` that takes an `Element` and returns `true` when the queue holds that item, or `false` when it doesn't. (Hint: the extension is in the same file as `Queue`, so it can read `items`.)
 */
extension Queue where Element: Equatable {
    func contains(_ value: Element) -> Bool {
        if items.contains(value) {
            return true
        }
        return false
    }
}




//:  Create a `Queue<String>` of three names, including `"Cal"`. Print whether it contains `"Cal"`, then whether it contains a name you didn't add.
var stringQueue = Queue<String>()
print(stringQueue.contains("Cal"))




//:  Here is a struct that isn't `Equatable`. Create a `Queue<Song>`, enqueue a song, and try calling `contains(_:)` on it. Read the error. Then make `Song` conform to `Equatable` and run it again. In a comment, explain why the error went away.


struct Song: Equatable {
    let title: String
    let artist: String
}

var songQueue = Queue<Song>()
songQueue.contains(Song(title: "Pizza", artist: "Joey"))

// Answer: it went away becasue we are comparing custom types and Equatable alows us to do that with out Equatable we cant do that.


/*:
 [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Order Line](@next)
 */

/*:
## App Exercise - Order Line

 >These exercises reinforce Swift concepts in the context of a coffee shop ordering app.

 Orders are made in the order they're placed, so the app keeps them in a queue. Copy your `Queue` and its extension from the last page, and paste them below the `Order` struct.
 */


struct Order {
    let customerName: String
    let drinkName: String
}


//:  Create a `Queue<Order>` called `orderLine`. Enqueue orders for Ana (Latte), Ben (Mocha), Cal (Cold Brew) and Dee (Iced Tea).





//:  Dequeue the first order and print a line like "Now making a Latte for Ana". (Hint: `dequeue()` returns an optional, so unwrap it with `if let`.) Then print how many orders are still waiting.





//:  Make `Order` conform to `Equatable`. Then create a new `Order` for Dee's Iced Tea, pass it to `orderLine.contains(_:)`, and print the result.





//:  The app also has a tip jar. A protocol can't use `<T>`, so this protocol uses `associatedtype` for its placeholder type. Each type that conforms decides what `Item` is.


protocol Container {
    associatedtype Item
    mutating func add(_ item: Item)
    var count: Int { get }
}


//:  Write a struct called `TipJar` that conforms to `Container`, with `Double` as its `Item`. Store the tips in a `private var tips: [Double]` that starts empty, and write the `add(_:)` method and `count` property that `Container` requires. Create a `TipJar`, add three tips, and print its `count`.





//:  In a comment, explain how Swift knows that `Item` is `Double` for `TipJar`.


// Answer:


/*:
 [Previous](@previous)  |  page 6 of 6
 */

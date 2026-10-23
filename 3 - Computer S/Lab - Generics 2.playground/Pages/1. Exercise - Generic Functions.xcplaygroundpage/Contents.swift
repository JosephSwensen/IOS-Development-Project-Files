/*:
## Exercise - Generic Functions

 A generic function is written once and works for many types. A type parameter, like `<T>`, is a placeholder that Swift fills in with a real type each time you call the function.

 These two functions do the same job. The only difference is the type.
 */


func duplicateInt(_ value: Int) -> [Int] {
    return [value, value]
}

func duplicateString(_ value: String) -> [String] {
    return [value, value]
}

print(duplicateInt(7))
print(duplicateString("Hi"))


//:  Write one generic function called `duplicate(_:)` that does the same job as both of them. It takes one argument of type `T`, with no argument label, and returns a `[T]` holding that value twice.
func duplicate<T>(_ value: T) -> [T] {
    
    return[value, value]
}




//:  Call `duplicate(_:)` three times: with an `Int`, with a `String` and with a `Bool`. Store each result in its own constant with a descriptive name, and print all three. Then option-click each constant and write its type in a comment next to it.
let duplicateInt = duplicate(5)
let duplicateString = duplicate("5")
let duplicateBool = duplicate(true)

print(duplicateInt) // [Int]
print(duplicateString) // [String]
print(duplicateBool) //[Bool]

//:  Write a generic function called `makeTrio(_:_:_:)` that takes three arguments of type `T`, none of them with argument labels, and returns a `[T]` holding all three, in order. Call it with three `Double` values and print the result.
func makeTrio<T>(_ fist: T, _ second: T, _ third: T) -> [T] {
    return [fist, second, third]
}

let makeTrioCall = makeTrio(3.3, 2.5, 3.2)
print(makeTrioCall)

//:  Call `makeTrio(_:_:_:)` with `1`, `"two"` and `3`. Read the error, then delete that line. In a comment, explain why Swift won't let these three values fill in `T`.
// makeTrio(1, "two", 3)

// Answer: because they all have to be the same type or else they fight each other.


//:  Write a generic function called `middleItem(of:)`. Its parameter is `of items: [T]`, and it returns a `T?`. If `items` is empty, return `nil`. Otherwise, return the item at index `items.count / 2`. Call it once with an `[Int]` and once with a `[String]`. Print each result, using `??` to give a fallback value.
func middleItem<T>(of items: [T]) -> T? {
    if items.isEmpty {
        return nil
    }
    return items[items.count / 2]
}

let middleItemCallInt = middleItem(of: [3, 7, 1, 9, 5, 7])
let middleItemCallString = middleItem(of: ["3", "7", "1"])

print(middleItemCallInt ?? "error")
print(middleItemCallString ?? "error")

//:  The `Any` type could also hold a value of any type. In a comment, explain what you would lose if `duplicate(_:)` took an `Any` and returned an `[Any]` instead of using `T`.


// Answer: it would lose type safety


/*:
 page 1 of 6  |  [Next: App Exercise - Order Helpers](@next)
 */

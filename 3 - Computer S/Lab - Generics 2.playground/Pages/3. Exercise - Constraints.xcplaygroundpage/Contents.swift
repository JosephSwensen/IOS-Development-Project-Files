/*:
## Exercise - Constraints

 A constraint limits which types can fill in a type parameter. `T: Equatable` means `T` can be any type that can be checked with `==`. `T: Comparable` means `T` can be any type that can be put in order with `<` and `>`.

 This function won't build. Read the error, then add a constraint so it builds. Don't change anything inside the function.
 */


func position<T: Equatable>(of target: T, in items: [T]) -> Int? {
    for index in 0..<items.count {
        if items[index] == target {
            return index
        }
    }
    return nil
}


//:  Create one `[String]` and one `[Int]`. For each array, call `position(of:in:)` once with a value that is in the array and once with a value that isn't, so four calls in all. Print each result, using `??` to print `-1` when the value isn't found.
var arrayOfStrings: [String] = ["Joey", "Pizza", "Tennis", "Ball"]
var arrayOfInt: [Int] = [3, 7, 5, 9, 5]

print(position(of: "Pizza", in: arrayOfStrings) ?? -1)
print(position(of:"Ben", in: arrayOfStrings) ?? -1)

print(position(of: 9, in: arrayOfInt) ?? -1)
print(position(of: 2, in: arrayOfInt) ?? -1)


//:  Here is a struct for a concert ticket. Make `Ticket` conform to `Equatable`. Then create a `[Ticket]` with three tickets, and use `position(of:in:)` to find one of them. Print the result.


struct Ticket: Equatable {
    let row: String
    let seat: Int
}

var ticketArray: [Ticket] = [Ticket(row: "2", seat: 43), Ticket(row: "7", seat: 21), Ticket(row: "9", seat: 51)]

print(position(of: Ticket(row: "7", seat: 21), in: ticketArray) ?? "Not found")
//:  Remove `: Equatable` from `Ticket` and read the error on your `position(of:in:)` call. Put `: Equatable` back. In a comment, explain what the error was telling you.


// Answer: it was telling me that ticket must comform to it becasue it was being compared with position and to compare custom types you have to make it comform to Equatable


//:  Write a generic function called `isBetween(_:low:high:)` that returns a `Bool`. It returns `true` when the first argument is greater than or equal to `low` and less than or equal to `high`. The first argument has no label, and all three arguments are the same type `T`. Add the constraint `T` needs. Call it with three `Int` values and with three `String` values, and print each result. (Strings are compared in alphabetical order, so `"m"` is between `"a"` and `"z"`.)
func isBetween<T: Comparable>(_ value: T, low: T, high: T) -> Bool {
    if value >= low && value <= high {
        return true
    }
    return false
}

let intCall = isBetween(11, low: 1, high: 10)
let stringCall = isBetween("f", low: "a", high: "z")

print(intCall)
print(stringCall)


//:  Call `isBetween(_:low:high:)` with three `Bool` values. Read the error, then delete that line. In a comment, explain why `Bool` can't be used here but `String` can.
// let boolCall = isBetween(true, low: true, high: false)

// Answer: becasue Bool only has 2 values it could be while string has more then 2 is it can compared.


/*:
 [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Where Clauses](@next)
 */

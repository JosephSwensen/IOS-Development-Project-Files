/*:
## Exercise - Syntactic Sugar

 Pages 3 and 4 are the Closures 3 lab. Pages 1 and 2 were the Closures 2 lab.

 Every exercise on this page sorts the collection below.
 */
let classmates = ["Maria", "Jonah", "Avery", "Blake", "Rae"]


//:  Call the collection's `sorted(by:)` function using trailing closure syntax. Keep the parameter names, parameter types, and the `return` statement in your closure. The closure should sort the names alphabetically. Store the result in `sortedCollection3`, then print the result.
var sortedCollection3 = classmates.sorted { (name1: String, name2: String) -> Bool in name1 < name2 }
print(sortedCollection3)
//:  Call `sorted(by:)` again, but remove as much of the unnecessary closure syntax as you can. Your answer should still be a closure. Store the result in `sortedCollection4`, then print the result.
var sortedCollection4 = classmates.sorted(){ $0 < $1}
print(sortedCollection4)
//:  In a comment below, explain why Swift lets you leave out the parameter types in `sortedCollection4`.
//syntactic sugar

//:  Sort the collection in reverse alphabetical order using shorthand argument names. Store the result in `reversedCollection`, then print the result.
var reversedCollection = classmates.sorted(){ $0 > $1}
print(reversedCollection)

//:  Sort the collection alphabetically one more time, but pass only an operator to `sorted(by:)`. Store the result in `sortedCollection5`, then print the result.
var sortedCollection5 = classmates.sorted(by: <)
print(sortedCollection5)

/*:
[Previous](@previous)  |  page 3 of 4  |  [Next: Exercise - Collection Functions](@next)
 */

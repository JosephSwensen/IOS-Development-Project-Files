/*:
## Exercise - Forms of Try
 
 The throwing function below produces an error if the user attempts to divide by zero. Call the function using `try` in a `do`/`catch` statement, printing the error to the console. Test using valid and invalid inputs to see the result.
 */

 enum MathError: Error {
    case divideByZero
 }

var number1: Double = 10
var number2: Double = 2

func divide(numerator: Double, by denominator: Double) throws -> Double {
    guard denominator != 0 else { throw MathError.divideByZero }
    return numerator / denominator
}
 
do {
    try print(divide(numerator: number1, by: number2))
} catch {
    print(error)
}
//:  Now call the function using `try?`. Since errors are not handled when using `try?`, you do not need a `do`/`catch` statement. Test using valid and invalid inputs, printing the result.
print(try? divide(numerator: number1, by: number2))

//:  Finally, call the function using `try!` and test it with an invalid input. What happens if the input is invalid? Write a comment explaining your answer, then set a valid input.
try! print(divide(numerator: number1, by: number2))
// it crashes the app becasue that is what the ! means but i works normal if the input is valid
/*:
[Previous](@previous)  |  page 2 of 4  |  [Next: Exercise - Associated Values](@next)
 */

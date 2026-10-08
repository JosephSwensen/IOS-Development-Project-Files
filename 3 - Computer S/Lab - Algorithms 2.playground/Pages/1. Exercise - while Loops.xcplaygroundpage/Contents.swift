/*:
## Exercise - while Loops

 A `while` loop repeats its body as long as its condition is `true`. It checks the condition before every run. Something inside the loop has to change, or the loop never stops.

 Create a variable called `secondsUntilDrop` and set it to `5`. Write a `while` loop that prints the seconds left, then subtracts 1, until `secondsUntilDrop` reaches 0. After the loop, print "Drop!" Run it and check the printout.
 */

var secondsUntilDrop: Int = 5

while secondsUntilDrop > 0 {
    print(secondsUntilDrop)
    secondsUntilDrop -= 1
}

print("Drop!")


//:  A new song starts with 50 plays a day, and its daily plays double every day. Create a variable called `dailyPlays` set to `50` and a variable called `daysSinceRelease` set to `0`. Write a `while` loop that doubles `dailyPlays` and adds 1 to `daysSinceRelease` until `dailyPlays` is at least 10,000. After the loop, print `daysSinceRelease`. Run it and check the printout.
var dailyPlays: Int = 50
var daysSinceRelease: Int = 0

while dailyPlays < 10_000 {
    dailyPlays *= 2
    daysSinceRelease += 1
}

print(daysSinceRelease)
//:  Read the code in the comment below. Do not copy it out and run it. In a comment, explain why this loop would never stop. Then, below your answer, write a fixed version that prints "Volume: 0" through "Volume: 9" and then stops.


// var volumeLevel = 0
// while volumeLevel < 10 {
//     print("Volume: \(volumeLevel)")
// }

// Why it never stops:
// befcasue the while loop dose not add to volumeLevel so it never gets above 10 so it runs over and over

var volumeLevel = 0
while volumeLevel < 10 {
    print("Volume: \(volumeLevel)")
    volumeLevel += 1
}

/*:
 page 1 of 12  |  [Next: Exercise - Ranges and Indexes](@next)
 */

/*:
## Exercise - Binary Search

 Binary search works like the guessing game. It checks the middle item and throws away the half that can't hold the target. It only works on a sorted array.

 The function below is already written. `low` and `high` mark the part of the array that could still hold the target.
 */


func binarySearch(for targetID: Int, in sortedSongIDs: [Int]) -> Int? {
    var checks = 0
    var low = 0
    var high = sortedSongIDs.count - 1

    while low <= high {
        let middle = (low + high) / 2
        checks += 1
        // Add the low, middle and high print here

        if sortedSongIDs[middle] == targetID {
            print("Found song \(targetID) after \(checks) checks")
            return middle
        } else if sortedSongIDs[middle] < targetID {
            low = middle + 1
        } else {
            high = middle - 1
        }
    }
    print("Song \(targetID) not found after \(checks) checks")
    return nil
}

let smallLibrary = Array(1...10)
let mediumLibrary = Array(1...100)
let largeLibrary = Array(1...1000)


//:  On the line that says `// Add the low, middle and high print here`, add `print("low: \(low), middle: \(middle), high: \(high)")`. This shows you how the search area shrinks each round.





//:  Before you run the call below, predict how many checks it takes to find song 700 in `largeLibrary`. Write your prediction in a comment. After you run it, look at the low, middle and high lines in the console. In a comment, describe what happens to the distance between `low` and `high` each round.


// Prediction:

_ = binarySearch(for: 700, in: largeLibrary)


//:  Add three lines below that search for song 0 in `smallLibrary`, `mediumLibrary` and `largeLibrary`. Then fill in the table. Copy your worst-case numbers for linear search from the previous page.




/*
 Library size | Linear search worst case | Binary search worst case
 10           |                          |
 100          |                          |
 1,000        |                          |
 */


//:  The array below is not sorted. Song 3 is in it. Predict in a comment whether `binarySearch` will find it. Then run the call and explain what happened.


let unsortedSongIDs = [42, 7, 93, 15, 68, 3, 81, 29, 56, 10]

// Prediction:

_ = binarySearch(for: 3, in: unsortedSongIDs)

// What happened:


//:  In a comment, explain what O(log n) means, using your table as the example.





/*:
 [Previous](@previous)  |  page 7 of 12  |  [Next: Exercise - Set vs Array Lookup](@next)
 */

/*:
## Exercise - Spot the Big-O

 Big-O describes how the work grows as the input grows. It is not a number of seconds.

 Each function below counts its work in a `steps` variable and prints it. You will not write these functions. Your job is to read each one, predict, run it and compare.

 From this page on, you will often write a prediction in a comment before you run code. A wrong prediction is fine. Explaining why it was wrong is the point.
 */


let playCounts = Array(1...10)

// Function A
func printFirstPlayCount(_ playCounts: [Int]) {
    var steps = 0
    steps += 1
    print("First play count: \(playCounts[0])")
    print("Function A steps: \(steps)")
}

// Function B
func printTotalPlays(_ playCounts: [Int]) {
    var steps = 0
    var totalPlays = 0
    for playCount in playCounts {
        totalPlays += playCount
        steps += 1
    }
    print("Total plays: \(totalPlays)")
    print("Function B steps: \(steps)")
}

// Function C
func printHighestAndLowest(_ playCounts: [Int]) {
    var steps = 0
    var highestCount = playCounts[0]
    for playCount in playCounts {
        if playCount > highestCount {
            highestCount = playCount
        }
        steps += 1
    }
    var lowestCount = playCounts[0]
    for playCount in playCounts {
        if playCount < lowestCount {
            lowestCount = playCount
        }
        steps += 1
    }
    print("Highest: \(highestCount), lowest: \(lowestCount)")
    print("Function C steps: \(steps)")
}

// Function D
func printPopularPairs(_ playCounts: [Int]) {
    var steps = 0
    var popularPairs = 0
    for firstCount in playCounts {
        for secondCount in playCounts {
            // Add steps += 1 here
            if firstCount + secondCount > 15 {
                popularPairs += 1
            }
        }
    }
    print("Popular pairs: \(popularPairs)")
    print("Function D steps: \(steps)")
}

// Function E
func printTopThree(_ playCounts: [Int]) {
    var steps = 0
    for index in 0..<3 {
        print("Top song \(index + 1): \(playCounts[index]) plays")
        steps += 1
    }
    print("Function E steps: \(steps)")
}


//:  Function D is missing its step counter. Add `steps += 1` on the line that says `// Add steps += 1 here`. Do not move it anywhere else.





//:  Before you run anything, fill in the "Big-O guess" and "Steps at 10" columns of the table below. Use O(1), O(n) or O(n²).


/*
 Function | Big-O guess | Steps at 10 | Steps at 100
 A        |             |             |
 B        |             |             |
 C        |             |             |
 D        |             |             |
 E        |             |             |
 */


//:  Call each of the five functions with `playCounts` and observe the printout. Then change `playCounts` at the top of the page to `Array(1...100)` and run the page again. Fill in the "Steps at 100" column.





//:  Function C has two loops, but it is not O(n²). In a comment, explain why.





//:  Function E has a loop, but it is O(1). In a comment, explain why.





/*:
 [Previous](@previous)  |  page 4 of 12  |  [Next: Exercise - Linear Search](@next)
 */

/*:
## Exercise - Sorting Algorithms

 Bubble sort swaps neighbors that are out of order. Selection sort finds the smallest item left and moves it to the front. Merge sort splits the list in half, sorts each half, then merges the halves in order.

 Each sort below is already written and counts its comparisons. You will predict, run and compare.
 */


func bubbleSort(_ playCounts: [Int]) -> [Int] {
    var sortedCounts = playCounts
    var comparisons = 0
    for pass in 0..<sortedCounts.count {
        for index in 0..<(sortedCounts.count - 1 - pass) {
            comparisons += 1
            if sortedCounts[index] > sortedCounts[index + 1] {
                // swapAt trades the items at these two positions
                sortedCounts.swapAt(index, index + 1)
            }
        }
    }
    print("Bubble sort: \(comparisons) comparisons")
    return sortedCounts
}

func selectionSort(_ playCounts: [Int]) -> [Int] {
    var sortedCounts = playCounts
    var comparisons = 0
    for startIndex in 0..<sortedCounts.count {
        var smallestIndex = startIndex
        for index in (startIndex + 1)..<sortedCounts.count {
            // Add comparisons += 1 here
            if sortedCounts[index] < sortedCounts[smallestIndex] {
                smallestIndex = index
            }
        }
        sortedCounts.swapAt(startIndex, smallestIndex)
    }
    print("Selection sort: \(comparisons) comparisons")
    return sortedCounts
}

// Merge sort calls itself, so it keeps its count outside the function
var mergeSortComparisons = 0

func merge(_ leftHalf: [Int], _ rightHalf: [Int]) -> [Int] {
    var mergedCounts: [Int] = []
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < leftHalf.count && rightIndex < rightHalf.count {
        mergeSortComparisons += 1
        if leftHalf[leftIndex] <= rightHalf[rightIndex] {
            mergedCounts.append(leftHalf[leftIndex])
            leftIndex += 1
        } else {
            mergedCounts.append(rightHalf[rightIndex])
            rightIndex += 1
        }
    }
    // One half is out of items. Add whatever is left in the other half.
    while leftIndex < leftHalf.count {
        mergedCounts.append(leftHalf[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightHalf.count {
        mergedCounts.append(rightHalf[rightIndex])
        rightIndex += 1
    }
    return mergedCounts
}

func mergeSort(_ playCounts: [Int]) -> [Int] {
    if playCounts.count <= 1 {
        return playCounts
    }
    let middle = playCounts.count / 2
    // Array(...) turns each half back into a regular array
    let leftHalf = mergeSort(Array(playCounts[0..<middle]))
    let rightHalf = mergeSort(Array(playCounts[middle..<playCounts.count]))
    return merge(leftHalf, rightHalf)
}


//:  In a comment, write which lines are the base case in `mergeSort`.





//:  `selectionSort` is missing its counter. On the line that says `// Add comparisons += 1 here`, add `comparisons += 1`.





//:  Before you run the code below, predict which sort will make the fewest comparisons on 10 play counts. Write it in a comment. Then run it and fill in the "10 shuffled" column of the table.


// Prediction:

let shuffledPlayCounts = [42, 7, 93, 15, 68, 3, 81, 29, 56, 10]

let bubbleSorted = bubbleSort(shuffledPlayCounts)
let selectionSorted = selectionSort(shuffledPlayCounts)
mergeSortComparisons = 0
let mergeSorted = mergeSort(shuffledPlayCounts)
print("Merge sort: \(mergeSortComparisons) comparisons")
print(mergeSorted)

/*
 Sort      | 10 shuffled | 10 already sorted | 100 shuffled
 Bubble    |             |                   |
 Selection |             |                   |
 Merge     |             |                   |
 */


//:  Below is a list that is already in order. Predict in a comment whether being sorted already will change the comparisons for each sort. Then add the lines to sort `alreadySorted` with all three sorts, the same way as above. Fill in the "10 already sorted" column.


let alreadySorted = Array(1...10)

// Prediction:


//:  `shuffled()` returns the same items in a random order. Sort `bigShuffle` with all three sorts the same way, and fill in the "100 shuffled" column. Your merge sort number may be a little different from a classmate's, because the order is random.


let bigShuffle = Array(1...100).shuffled()


//:  In a comment, explain why bubble and selection sort are O(n²) and merge sort is O(n log n). Use your 100 shuffled numbers as the example.





//:  In an app, you would use Swift's built-in sort. Add one line that makes a new array called `titlesZToA` from `playlistTitles`, sorted from Z to A with `sorted(by:)`, and print it.


let playlistTitles = ["Rooftop Radio", "Coffee at Noon", "Static Summer", "Late Bus Home"]


/*:
 [Previous](@previous)  |  page 11 of 12  |  [Next: Exercise - Interview Questions](@next)
 */

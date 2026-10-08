/*:
## Exercise - Ranges and Indexes

 A `for`-in loop can run over a range of numbers. `1...5` is a closed range: it includes 5. `1..<5` is a half-open range: it stops before 5.

 `enumerated()` hands you each item's index along with the item. The index starts at 0.
 */


let topSongs = ["Late Bus Home", "Coffee at Noon", "Static Summer", "Paper Lanterns", "Back Porch Blues", "Rooftop Radio"]


//:  Write a `for`-in loop over the range `1...5` that prints "Track 1" through "Track 5". Run it and check the printout.
for tracks in 1...5 {
    print("Track: \(tracks)")
}




//:  Copy your loop and change the range to `1..<5`. In a comment, explain what changed in the printout and why.
for tracks in 1..<5 {
    print("Track: \(tracks)")
}

// it only print up to 4 becasue it was 1..<5 which means dont go above 5


//:  Write a `for`-in loop over the range `0..<topSongs.count`. Use each number as an index to print the song at that position, like `topSongs[index]`. In a comment, explain why this range uses `..<` and not `...`.
for index in 0..<topSongs.count {
    print(topSongs[index])
}

// so it dose not go above it becasue there is nothing after it


//:  Use `enumerated()` to print the songs as a numbered chart that starts at 1, like "1. Late Bus Home". (Hint: the index starts at 0, so add 1 before you print it.)
for (index, song) in topSongs.enumerated() {
    print("\(index + 1). \(song)")
}




//:  Create a variable called `searchIndex` set to `0`. Write a `while` loop that walks through `topSongs` by index and stops at "Paper Lanterns". Print the index where it stopped. Your loop must also stop at the end of the array if the song is not there. (Hint: you can join two conditions with `&&`, like `searchIndex < topSongs.count && topSongs[searchIndex] != "Paper Lanterns"`.)
var searchIndex: Int = 0

while searchIndex < topSongs.count && topSongs[searchIndex] != "Paper Lanterns" {
    searchIndex += 1
}

print(searchIndex)
/*:
 [Previous](@previous)  |  page 2 of 12  |  [Next: App Exercise - Genre Sets](@next)
 */

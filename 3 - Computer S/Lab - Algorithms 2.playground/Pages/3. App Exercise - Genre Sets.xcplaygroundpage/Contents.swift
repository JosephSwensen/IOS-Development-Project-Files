/*:
## App Exercise - Genre Sets

 >These exercises reinforce Swift concepts in the context of a music streaming app.

 A `Set` holds unique values with no order. Adding a value that is already in the set does nothing.
 */


let listeningHistory = ["Pop", "Rock", "Pop", "Jazz", "Hip-Hop", "Rock", "Pop", "Country", "Jazz"]
let friendGenres: Set<String> = ["Jazz", "Classical", "Pop", "Folk"]


//:  Create a variable called `genresListened` that is a `Set` made from `listeningHistory`. (Hint: `Set(listeningHistory)` makes a set from an array.) Print the count of `listeningHistory` and the count of `genresListened`. In a comment, explain why the two counts are different.
var genresListened = Set(listeningHistory)

print(listeningHistory.count)
print(genresListened.count)
// the fist one counts how many elements are in the array while the genresListened one is 5 sense, we turned it into a set, the set combines all of the same elements, so it would be five.
//:  The user listens to a classical song. Insert "Classical" into `genresListened` and print the count. Then insert "Pop" and print the count again. In a comment, explain why the second count did not change.
genresListened.insert("Classical")
print(genresListened.count)
genresListened.insert("Pop")
print(genresListened.count)
// it did not change becasue Pop already existed and the same thing can not exist twice in the same set.

//:  Use `contains` to check whether `genresListened` has "Jazz" and whether it has "Metal". Print a message for each one, like "You listen to Jazz" or "You have not tried Metal yet."
var checkJazz = genresListened.contains("Jazz")
var checkMetal = genresListened.contains("Metal")

if checkJazz {
    print("you have listen to Jazz")
} else {
    print("you have not listen to Jazz yet")
}

if checkMetal {
    print("you have listen to Metal")
} else {
    print("you have not listen to Metal yet")
}


//:  The user hides "Country" from their profile. Remove it from `genresListened`, then print the set. In a comment, explain why the genres might not print in the same order they appear in `listeningHistory`.
genresListened.remove("Country")
print(genresListened)

// becasue set dose not have a order


//:  The app shows genres two friends have in common. Write a `for`-in loop over `genresListened`. Use `contains` to print each genre that is also in `friendGenres`.
for genre in genresListened {
    if friendGenres.contains(genre) {
        print("\(genre) is also in your friends genres")
    }
}




/*:
 [Previous](@previous)  |  page 3 of 12  |  [Next: Exercise - Spot the Big-O](@next)
 */

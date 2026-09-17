/*:
## App Exercise - More Than a Number

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Pages 5 through 8 are the `@State` 2 lab. Pages 1 through 4 were the night before.

 A `@State` property can hold any type, not just an `Int`. The view below tracks minutes with an `Int`. You are going to add a `Bool` and a `String` next to it.
 */


import SwiftUI
import PlaygroundSupport

struct WorkoutView: View {
    @State private var minutesExercised = 0

    var body: some View {
        VStack {
            Text("Minutes: \(minutesExercised)")
            Button("Add 10 minutes") {
                minutesExercised += 10
            }
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(WorkoutView())


/*:
 Make all six changes below inside `WorkoutView` in the code above.

 1. Add a `@State` property called `goalMet` that holds a `Bool`, starting at `false`.
 2. Under the minutes `Text`, add a `Text` that reads `Goal met` when `goalMet` is `true` and `Not there yet` when it is `false`. Use a ternary, the same way the slides did today.
 3. Add a `Button` labeled `Toggle goal` that flips `goalMet` between `true` and `false`. (Hint: `goalMet.toggle()` flips a `Bool`.)
 4. Add a `@State` property called `workoutName` that holds a `String`, starting at `"Morning walk"`.
 5. At the top of the `VStack`, above the minutes `Text`, add a `Text` that shows `workoutName`.
 6. Add a `Button` labeled `Rename to Evening run` that sets `workoutName` to `"Evening run"`.

 Run the page and tap all three buttons. Tapping one button should leave the other two values alone.
 */


/*:
 [Previous](@previous)  |  page 5 of 8  |  [Next: Exercise - Predict the Redraw](@next)
 */

/*:
## Black Diamond - A Type You Wrote Yourself

 This page is optional.

 A `@State` property can also hold a struct you wrote yourself.
 */


import SwiftUI
import PlaygroundSupport

struct Workout {
    var name: String
    var minutes: Int
}

struct WorkoutCardView: View {
    @State private var workout = Workout(name: "Morning walk", minutes: 0)

    var body: some View {
        VStack {
            Text(workout.name)
            Text("Minutes: \(workout.minutes)")

        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(WorkoutCardView())


/*:
 Add a `Button` labeled `Add 10 minutes` inside the `VStack` above. It should add 10 to `workout.minutes`. Run the page and tap it.

 One `@State` property is holding a whole struct, and changing one property inside that struct still redraws the view.

 On page 1 you saw that a view cannot change its own plain `var`. Here `workout.minutes += 10` changes the `Workout` struct. Explain in a comment why `@State` allows that.
 */





/*:
 [Previous](@previous)  |  page 8 of 8
 */

/*:
## App Exercise - A Goal Tracker

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 One value, and three buttons that change it.
 */


import SwiftUI
import PlaygroundSupport

struct GoalTrackerView: View {
    var body: some View {
        VStack {
            Text("Step goal")

        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(GoalTrackerView())


/*:
 Make all four changes below inside `GoalTrackerView` in the code above.

 1. Add a `@State` property called `stepGoal` and give it a starting value of `5000`.
 2. Inside the `VStack`, under `Text("Step goal")`, add a `Text` view that shows the value of `stepGoal`.
 3. Under that `Text` view, add an `HStack` holding three buttons. One labeled `-1000` subtracts 1000 from `stepGoal`. One labeled `Reset` sets `stepGoal` back to 5000. One labeled `+1000` adds 1000 to `stepGoal`.
 4. Add a `Spacer()` between the `Text` view showing `stepGoal` and the `HStack`, so the buttons sit at the bottom of the view.

 Run the page and tap all three buttons.

 You have one `stepGoal` property and three buttons that change it. Explain in a comment below why the `Text` view shows the right number no matter which button you tap.
 */





/*:
 [Previous](@previous)  |  page 4 of 8  |  [Next: App Exercise - More Than a Number](@next)
 */

/*:
## App Exercise - Counting Steps

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Now build that counter the way it is supposed to work.

 The code below opens a live view so you can see your buttons and tap them. You have not seen `PlaygroundSupport` or `setLiveView` before and you do not need to understand them today. The `.frame` line only sets the size of the preview.

 Open the live view before you run this page. In Xcode, choose View > Assistant Editor > Show Assistant Editor. The first run on this page can take twenty seconds or so.
 */


import SwiftUI
import PlaygroundSupport

struct StepCounterView: View {
    var body: some View {
        VStack {
            Text("Steps today")

        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(StepCounterView())


/*:
 Make all three changes below inside `StepCounterView` in the code above.

 1. Add a `@State` property called `stepCount` and give it a starting value of `0`.
 2. Inside the `VStack`, under `Text("Steps today")`, add a `Text` view that shows the value of `stepCount`.
 3. Under that `Text` view, add a `Button` labeled `Add 500 steps`. Tapping it should add 500 to `stepCount`.

 Run the page and tap the button four times. The number on screen should read 2000.
 */


/*:
 [Previous](@previous)  |  page 2 of 8  |  [Next: Exercise - Fixing a Broken Counter](@next)
 */

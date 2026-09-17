/*:
## Exercise - Fixing a Broken Counter

 This counter does not count. One thing is missing.

 This page will not compile until you fix it. That is on purpose.
 */


import SwiftUI
import PlaygroundSupport

struct WaterTrackerView: View {
    var glassesOfWater = 0

    var body: some View {
        VStack {
            Text("Glasses of water: \(glassesOfWater)")
            Button("Drink a glass") {
                glassesOfWater += 1
            }
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(WaterTrackerView())


/*:
 Fix `WaterTrackerView` in the code above so the page compiles. Run it and tap the button three times to confirm the number goes up.

 Explain in one sentence, in a comment below, what `@State` gave `glassesOfWater` that a plain `var` did not.
 */





/*:
 [Previous](@previous)  |  page 3 of 8  |  [Next: App Exercise - A Goal Tracker](@next)
 */

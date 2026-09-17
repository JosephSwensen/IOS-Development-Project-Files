/*:
## Exercise - Predict the Redraw

 Do not run this page yet. Read it first.
 */


import SwiftUI
import PlaygroundSupport

struct DailySummaryView: View {
    @State private var dayName = "Monday"
    @State private var stepsTaken = 0
    @State private var goalMet = false

    var body: some View {
        VStack {
            Text(dayName)
            Text("Steps: \(stepsTaken)")
            Text(goalMet ? "Goal met" : "Not there yet")
            Button("Walk 2000 steps") {
                stepsTaken += 2000
            }
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(DailySummaryView())


//:  Predict what each of the three `Text` views will show after you tap the button one time. Write all three predictions in comments below before you run anything.





/*:
 Now run the page and tap the button once. Compare what you see to your three predictions.

 Two of the three `Text` views show exactly what they showed before. SwiftUI rebuilt both of them anyway. Explain in a comment why that still counts as a redraw.
 */





/*:
 [Previous](@previous)  |  page 6 of 8  |  [Next: App Exercise - Build Your Own Card](@next)
 */

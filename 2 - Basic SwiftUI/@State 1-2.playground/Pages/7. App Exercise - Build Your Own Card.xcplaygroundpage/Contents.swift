/*:
## App Exercise - Build Your Own Card

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Now build one from scratch. Track whatever you want. A run, a lifting session, glasses of water, hours of sleep.
 */


import SwiftUI
import PlaygroundSupport

struct MyTrackerView: View {

    @State var leangthOfSleep: Int = 0
    @State var quilty: String = ""
    @State var doYouFeelRested: Bool = false
    
    var body: some View {
        VStack {
            Text("\(leangthOfSleep)")
            Button("add 1hr") {
                leangthOfSleep += 1
            }
            
            
            Text("\(quilty)")
            Button("quilty good") {
                quilty = "good"
            }
            
            Text("\(doYouFeelRested)")
            Button("do You Feel Rested yes or no") {
                doYouFeelRested.toggle()
            }
Spacer()
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(MyTrackerView())


/*:
 Build `MyTrackerView` in the code above so that it has all four of the following.

 1. Three `@State` properties. One holds an `Int`, one holds a `String`, and one holds a `Bool`.
 2. A `Text` view for each of the three properties.
 3. A `Button` for each of the three properties. Each button changes only its own property.
 4. A `Spacer()` somewhere in the `VStack`.

 Run the page and tap each button. Confirm that each button leaves the other two values where they were.
 */


/*:
 [Previous](@previous)  |  page 7 of 8  |  [Next: Black Diamond - A Type You Wrote Yourself](@next)
 */

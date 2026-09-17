/*:
## Exercise - Why a View Needs @State

 Pages 1 through 4 are the `@State` 1 lab.

 A SwiftUI view is a struct. In Course 1 you learned that a method on a struct has to be marked `mutating` before it can change one of the struct's own properties.

 `body` is not marked `mutating`, and it cannot be. That is the reason `@State` exists.

 Below is a counter view with the `@State` left out. It is commented out so this page still runs. Uncomment the whole block, read the error Xcode puts on the line `tapCount += 1`, then comment the block back out so the page runs again.
 */


import SwiftUI

struct BrokenCounterView: View {
    var tapCount = 0

    var body: some View {
        VStack {
            Text("Taps: \(tapCount)")
            Button("Tap me") {
                //tapCount += 1
            }
        }
    }
}


//:  Write the error message Xcode gave you in a comment below. Start a line with `//` to write a comment.
//Left side of mutating operator isn't mutable: 'self' is immutable




//:  The button's action runs inside `body`, and `body` is not `mutating`. Explain in a comment why that stops `tapCount += 1` from working.
//becase it stops the botton from changing the value you have to have to @State




/*:
 page 1 of 8  |  [Next: App Exercise - Counting Steps](@next)
 */

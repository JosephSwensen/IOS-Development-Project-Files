/*:
## Exercise - Setting a Value for Part of the Screen

 On page 1 you read a value from the environment. `.environment(\.colorScheme, .dark)` puts a value in. Only the views inside the view you put it on see the new value.

 `SchemeLabel` below is already finished. It shows `Light` or `Dark` depending on the color scheme it reads.
 */


import SwiftUI
import PlaygroundSupport

struct SchemeLabel: View {
    let labelNumber: Int
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Text("\(labelNumber): \(colorScheme == .dark ? "Dark" : "Light")")
            .padding()
            .foregroundStyle(colorScheme == .dark ? Color.yellow : Color.black)
            .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct SchemeTestView: View {
    var body: some View {
        VStack(spacing: 20) {
            SchemeLabel(labelNumber: 1)
            HStack {
                SchemeLabel(labelNumber: 2)
                SchemeLabel(labelNumber: 3)
            }
            VStack {
                SchemeLabel(labelNumber: 4)
            }
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(SchemeTestView())


/*:
 Using exactly one `.environment` modifier, make labels 2 and 3 dark. Labels 1 and 4 should stay light. Run the page to check.

 Now add one more `.environment` modifier so label 4 is dark too. Run the page to check.

 Remove both of your modifiers. Put a single `.environment(\.colorScheme, .dark)` on the outer `VStack` instead, so all four labels are dark. Then add one more `.environment` modifier so label 1 is light again, without changing the other three.

 In a comment below, explain why label 1 is light even though the `VStack` around it is set to dark.
 */





/*:
 [Previous](@previous)  |  page 3 of 9  |  [Next: Exercise - Removing the Middlemen](@next)
 */

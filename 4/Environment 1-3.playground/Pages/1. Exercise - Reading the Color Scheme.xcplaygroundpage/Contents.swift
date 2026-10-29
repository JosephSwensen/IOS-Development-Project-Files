/*:
## Exercise - Reading the Color Scheme

 Pages 1 through 3 are the Environment 1 lab. Pages 4 and 5 are Environment 2, and pages 6 through 8 are Environment 3. Page 9 is an optional Black Diamond.

 The environment is a set of values SwiftUI passes down to every view. You read one of them with `@Environment` and a key path, like `\.colorScheme`.

 Open the live view before you run this page. In Xcode, choose View > Assistant Editor > Show Assistant Editor. The first run on a page can take twenty seconds or so.

 The code below shows `ModeCard` twice. The second copy has a line that switches it to dark mode. You'll learn how that line works in Environment 2. For now, leave it alone.
 */


import SwiftUI
import PlaygroundSupport

struct ModeCard: View {
    @Environment(\.colorScheme) private var currentScheme
    
    var body: some View {
        Text(currentScheme == .dark ? "Dark mode" : "Light mode")
            .padding()
            .backgroundStyle(currentScheme == .light ? .white : .black)
            .foregroundStyle(currentScheme == .light ? .black : .yellow)
    }
}

struct TwoCardsView: View {
    var body: some View {
        VStack(spacing: 20) {
            ModeCard()
            ModeCard()
                .environment(\.colorScheme, .dark)
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(TwoCardsView())


/*:
 Make all four changes below inside `ModeCard` in the code above.

 1. Add a property that reads the color scheme: `@Environment(\.colorScheme) private var colorScheme`.
 2. Change the text so it says `Light mode` when `colorScheme` is `.light`, and `Dark mode` when it is `.dark`. (Hint: you can use the ternary operator, `colorScheme == .dark ? "Dark mode" : "Light mode"`.)
 3. Give the text a background that is white in light mode and black in dark mode.
 4. Give the text a foreground style that is black in light mode and yellow in dark mode.

 Run the page. The top card should say `Light mode` in black on white. The bottom card should say `Dark mode` in yellow on black.

 Now rename your property from `colorScheme` to `currentScheme`, everywhere you use it, and run the page again. In a comment below, explain which part of the `@Environment` line decides which value you get: the name after `var`, or `\.colorScheme`.
 */
// \.colorScheme




/*:
 page 1 of 9  |  [Next: App Exercise - Leaving the Workout Screens](@next)
 */

/*:
## Black Diamond - A Control That Knows When It Is Off

 This page is optional.

 One `.disabled` modifier on a stack turns off every control inside it. Apple's controls read `isEnabled` from the environment to know when they are off. Your own views can read it too: `@Environment(\.isEnabled) private var isEnabled`.
 */


import SwiftUI
import PlaygroundSupport

struct SnackOrderView: View {
    @State private var storeIsOpen = true

    var body: some View {
        VStack(spacing: 20) {
            Toggle("Store is open", isOn: $storeIsOpen)

        }
        .padding()
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(SnackOrderView())


/*:
 1. Write a view called `PillButton`. It takes a `title` and an `action` closure, and shows a `Button` whose label is the title on a blue capsule with white text. (Hint: `.clipShape(.capsule)` gives a view a capsule shape.)
 2. Under the toggle, show three `PillButton`s labeled `Chips`, `Pretzels` and `Popcorn`. Each one should print the snack's name when tapped.
 3. Put the three buttons in a `VStack`, and turn them all off with one `.disabled` modifier when `storeIsOpen` is `false`.
 4. Make `PillButton` turn gray when it is turned off. `PillButton` must not take a new parameter to do this. It has to find out from the environment.

 Run the page and turn off `Store is open`. All three pills should turn gray and stop printing.

 In a comment below, explain how `PillButton` found out it was turned off, even though you never passed it anything new.
 */





/*:
 [Previous](@previous)  |  page 9 of 9
 */

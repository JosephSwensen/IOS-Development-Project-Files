/*:
## Exercise - Your Own Environment Value

 Pages 6 through 8 are the Environment 3 lab.

 You can add your own value to the environment. Add a property to `EnvironmentValues` in an extension, and mark it `@Entry`. The value after `=` is the default. Every view gets the default until someone sets a different value.
 */


import SwiftUI
import PlaygroundSupport

struct RecipeTag: View {
    let tagName: String

    var body: some View {
        Text(tagName)
            .padding(8)
            .background(Color.gray)
            .clipShape(.capsule)
    }
}

struct RecipeBookView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("Vegetarian")
                .font(.headline)
            HStack {
                RecipeTag(tagName: "Pasta")
                RecipeTag(tagName: "Salad")
            }
            Text("Desserts")
                .font(.headline)
            HStack {
                RecipeTag(tagName: "Brownies")
                RecipeTag(tagName: "Pie")
            }
            Text("Everything Else")
                .font(.headline)
            RecipeTag(tagName: "Leftovers")
        }
        .frame(width: 320, height: 480)
    }
}

PlaygroundPage.current.setLiveView(RecipeBookView())


/*:
 Make all three changes below in the code above.

 1. Add an extension on `EnvironmentValues` with a new value: `@Entry var tagColor: Color = .gray`.
 2. In `RecipeTag`, read it with `@Environment(\.tagColor) private var tagColor`, and use it as the background instead of `Color.gray`.
 3. In `RecipeBookView`, make the vegetarian tags green and the dessert tags pink. Use one `.environment` modifier for each `HStack`.

 Run the page. `Leftovers` should still be gray.

 Change the default in your `@Entry` line from `.gray` to `.orange` and run the page again. In a comment below, say which tags changed color and why the others did not.
 */





//:  `tagColor` is one simple value with a default. In a comment below, explain why `@Entry` is a better fit for it than an `@Observable` class shared with `.environment`.





/*:
 [Previous](@previous)  |  page 6 of 9  |  [Next: Exercise - Editing a Shared Object](@next)
 */

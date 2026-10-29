/*:
## Exercise - Removing the Middlemen

 Pages 4 and 5 are the Environment 2 lab.

 A bakery app keeps its order in a class called `BakeryOrder`. Only two views use the order: `OrderTotalLabel` and `AddCupcakeButton`. But right now, every view on the way down to `AddCupcakeButton` has to take the order and pass it on.

 Run the page and tap `Add a cupcake` a few times to see how it works now.
 */


import SwiftUI
import PlaygroundSupport

@Observable
class BakeryOrder {
    var cupcakeCount = 0

    func addCupcake() {
        cupcakeCount += 1
    }
}

struct BakeryScreen: View {
    @State private var order = BakeryOrder()

    var body: some View {
        VStack(spacing: 20) {
            OrderTotalLabel(order: order)
            MenuSection(order: order)
        }
        .frame(width: 320, height: 480)
    }
}

struct OrderTotalLabel: View {
    let order: BakeryOrder

    var body: some View {
        Text("Cupcakes in your order: \(order.cupcakeCount)")
            .font(.headline)
    }
}

struct MenuSection: View {
    let order: BakeryOrder

    var body: some View {
        VStack {
            Text("Menu")
                .font(.title)
            CupcakeRow(order: order)
        }
    }
}

struct CupcakeRow: View {
    let order: BakeryOrder

    var body: some View {
        HStack {
            Text("Chocolate cupcake")
            AddCupcakeButton(order: order)
        }
    }
}

struct AddCupcakeButton: View {
    let order: BakeryOrder

    var body: some View {
        Button("Add a cupcake") {
            order.addCupcake()
        }
    }
}

PlaygroundPage.current.setLiveView(BakeryScreen())


/*:
 Make all four changes below in the code above.

 1. In `BakeryScreen`, share the order with every view inside by adding `.environment(order)` to the `VStack`.
 2. In `OrderTotalLabel` and `AddCupcakeButton`, replace `let order: BakeryOrder` with `@Environment(BakeryOrder.self) private var order`.
 3. Remove the `order` property from `MenuSection` and `CupcakeRow`, and remove `order: order` everywhere it is passed. When you're done, `MenuSection` and `CupcakeRow` should not mention `BakeryOrder` at all.
 4. Run the page and tap `Add a cupcake` three times. The total should go up by 3.

 Now comment out `.environment(order)` and run the page. Write the error message in a comment below, and explain in your own words what went wrong. Then put `.environment(order)` back.
 */





/*:
 [Previous](@previous)  |  page 4 of 9  |  [Next: App Exercise - Sharing the Step Tracker](@next)
 */

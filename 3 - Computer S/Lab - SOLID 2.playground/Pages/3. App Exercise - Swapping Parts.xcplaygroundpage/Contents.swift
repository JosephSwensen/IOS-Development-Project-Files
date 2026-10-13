/*:
## App Exercise - Swapping Parts

 >These exercises reinforce Swift concepts in the context of a food truck app.

 This page is the SOLID 3 lab.

 Every worker on the truck has to conform to `FoodTruckWorker`. Look at the empty functions in `Chef` and `Cashier`.
 */


protocol FoodTruckWorker {
    func cook()
    func takePayment()
}

class Chef: FoodTruckWorker {
    func cook() {
        print("Cooking street tacos")
    }

    func takePayment() { }
}

class Cashier: FoodTruckWorker {
    func cook() { }

    func takePayment() {
        print("Taking payment")
    }
}

let chef = Chef()
chef.cook()

let cashier = Cashier()
cashier.takePayment()


//:  In a comment, explain which SOLID principle `FoodTruckWorker` breaks.


// Principle:


//:  Split `FoodTruckWorker` into two protocols called `Cooking` and `PaymentTaking`, each with one function. Delete `FoodTruckWorker`. Change `Chef` and `Cashier` so each one conforms only to the protocol it needs, and delete their empty functions. Run the page and check that the printout has not changed.





//:  When the window has an order ready, `OrderWindow` lets the customer know.


protocol OrderNotifier {
    func notify(_ message: String)
}

class TextNotifier: OrderNotifier {
    func notify(_ message: String) {
        print("Text message: \(message)")
    }
}

class SpeakerNotifier: OrderNotifier {
    func notify(_ message: String) {
        print("Speaker: \(message)")
    }
}

class OrderWindow {
    private let notifier = TextNotifier()

    func callOrder(for customerName: String) {
        notifier.notify("\(customerName), your order is ready!")
    }
}


//:  `OrderWindow` creates a `TextNotifier` itself, so it can only ever send texts. Change `OrderWindow` so its `notifier` property is an `OrderNotifier` that is passed in through an initializer. Then create two `OrderWindow` instances, one with a `TextNotifier` and one with a `SpeakerNotifier`. Call `callOrder(for:)` on both and observe the printout.





//:  In a comment, name the SOLID principle that `MenuBoard` breaks and explain why.


class MenuBoard {
    var itemNames: [String] = []

    func addItem(_ itemName: String) {
        itemNames.append(itemName)
    }

    func chargeCard(amount: Double) {
        print("Charging $\(amount)")
    }
}

// Principle:
// Why:


/*:
 [Previous](@previous)  |  page 3 of 3
 */

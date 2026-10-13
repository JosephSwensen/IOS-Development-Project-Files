/*:
## App Exercise - One Job Per Class

 >These exercises reinforce Swift concepts in the context of a food truck app.

 This page is the SOLID 1 lab.

 A class should only have one reason to change. `FoodTruckOrder` below stores an order, but it does other jobs too.
 */


class FoodTruckOrder {
    var customerName: String
    var itemNames: [String] = []
    var total = 0.0

    init(customerName: String) {
        self.customerName = customerName
    }

    func addItem(named itemName: String, price: Double) {
        itemNames.append(itemName)
        total += price
    }
}




//:  In a comment, write what each letter in SOLID stands for. Try it from memory before you check your notes.


// S: Single Responsibility Principle
// O: Open-Closed Principle
// L: Liskov Substitution Principle
// I: Interface Segregation Principle
// D: Dependency Inversion Principle


//:  `FoodTruckOrder` does three different jobs. In a comment, name each job.


// Job 1: add a item
// Job 2: print a receipt
// Job 3: send a ready text


//:  Split the class. Create a class called `ReceiptPrinter` with a function called `printReceipt(for order: FoodTruckOrder)`. Create a class called `OrderTexter` with a function called `sendOrderReadyText(for order: FoodTruckOrder)`. Move the code from `FoodTruckOrder` into the new functions, then delete `printReceipt()` and `sendOrderReadyText()` from `FoodTruckOrder`. Create an instance of each new class, call both functions with `tacoOrder`, and observe the printout.
class ReceiptPrinter: FoodTruckOrder {
    func printReceipt(for order: FoodTruckOrder) {
        print("Receipt for \(customerName)")
        for itemName in itemNames {
            print("- \(itemName)")
        }
        print("Total: $\(total)")
    }
}

class OrderTexter: FoodTruckOrder {
    func sendOrderReadyText(for order: FoodTruckOrder) {
        print("Texting \(customerName): Your order is ready!")
    }
}

let tacoOrder = FoodTruckOrder(customerName: "Maya")
tacoOrder.addItem(named: "Street Tacos", price: 9.5)
tacoOrder.addItem(named: "Horchata", price: 3.25)
//:  The owner wants the text message to include the order total. In a comment, say which class you would open to make that change. Then explain why that is easier than it was before you split the class.


// Class to open:
// Why it's easier:


/*:
 page 1 of 3  |  [Next: App Exercise - Adding to the Menu](@next)
 */

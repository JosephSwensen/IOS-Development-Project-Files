/*:
## Exercise - Protocols as Types

 In Protocols 1 you wrote protocols and made your own types conform to them. Now you'll use a protocol's name as a type. A protocol's name can go anywhere a type name can: the type of a property, the type of a parameter, or the type of an array. Anything that conforms to the protocol fits.

 Write a protocol called `Vehicle` with two requirements: a property called `wheelCount` of type `Int` that can be read, and a method called `describe()` that returns a `String`.
 */
protocol Vehicle {
    var wheelCount: Int { get }
    
    func describe() -> String
}




//:  Write two structs that conform to `Vehicle`: `Bicycle`, which has 2 wheels, and `DeliveryTruck`, which has 6. Each one's `describe()` should return a sentence with its number of wheels in it, like "A bicycle with 2 wheels".
struct Bicycle: Vehicle {
    var wheelCount: Int = 2
    
    func describe() -> String {
        return "A bicycle with 2 wheels"
    }
}

struct DeliveryTruck: Vehicle {
    var wheelCount: Int = 6
    
    func describe() -> String {
        return "A deliveryTruck with 6 wheels"
    }
}


//:  Write a struct called `ParkingSpot` with one property called `parkedVehicle`. Its type should be `Vehicle`.
struct ParkingSpot {
    var parkedVehicle: Vehicle
}




//:  Create a variable called `cornerSpot` that is a `ParkingSpot` holding a `Bicycle`. Print `cornerSpot.parkedVehicle.describe()`. Then put a `DeliveryTruck` in `cornerSpot.parkedVehicle` and print it again. Observe the printout.
var cornerSpot: ParkingSpot = ParkingSpot(parkedVehicle: Bicycle(wheelCount: 2))

print(cornerSpot.parkedVehicle.describe())

cornerSpot.parkedVehicle = DeliveryTruck(wheelCount: 6)

print(cornerSpot.parkedVehicle.describe())


//:  Write a function called `printTollCost(for:)` that takes one `Vehicle` argument. The toll is $2 per wheel. Print a line like "Toll for a vehicle with 2 wheels: $4". Call the function once with a `Bicycle` and once with a `DeliveryTruck`, and observe the printout.
func printTollCost(for vehicle: Vehicle) {
    print("Toll for a vehicle with \(vehicle.wheelCount) wheels: $\(vehicle.wheelCount * 2)")
}

printTollCost(for: Bicycle(wheelCount: 2))
printTollCost(for: DeliveryTruck(wheelCount: 6))

//:  Create a constant called `parkingLot` of type `[Vehicle]` that holds two bicycles and one delivery truck. Use a `for`-`in` loop to print `describe()` for every vehicle in the lot.
let parkingLot: [Vehicle] = [Bicycle(wheelCount: 2), Bicycle(wheelCount: 2), DeliveryTruck(wheelCount: 6)]

for vehicle in parkingLot {
    print(vehicle.describe())
}


//:  Use a second `for`-`in` loop to add up the `wheelCount` of every vehicle in `parkingLot`. Print the total. It should be 10.
var wheelCountAdds: Int = 0

for vehicle in parkingLot {
    wheelCountAdds += vehicle.wheelCount
}

print(wheelCountAdds)


//:  Try adding the number `4` to the array in `parkingLot`. Read the error, then take the `4` back out. In a comment, explain what the error is telling you.


// Answer: Every element in [Vehicle] must conform to Vehicle. The number 4
// is an Int, and Int does not conform to Vehicle, so it cannot go in the array.


/*:
 page 1 of 8  |  [Next: App Exercise - Watering Schedule](@next)
 */

/*:
## App Exercise - Passing In a Sensor

 >These exercises reinforce Swift concepts in the context of a plant care app.

 The app now reads a moisture sensor in each pot and gives watering advice. `Int.random(in: 0...100)` stands in for the real sensor. It returns a different number between 0 and 100 each time.
 */


struct LiveMoistureSensor: MoistureSensor {
    func readMoisturePercent(forPlantNamed plantName: String) -> Int {
        print("Reading the sensor in \(plantName)'s pot...")
        return Int.random(in: 0...100)
    }
}

struct WateringAdvisor {
    let sensor: MoistureSensor

    func advice(forPlantNamed plantName: String) -> String {
        let moisturePercent = sensor.readMoisturePercent(forPlantNamed: plantName)
        if moisturePercent < 30 {
            return "Water \(plantName) today."
        } else if moisturePercent > 80 {
            return "\(plantName) is too wet. Skip watering."
        } else {
            return "\(plantName) is fine."
        }
    }
}

let advisor = WateringAdvisor(sensor: LiveMoistureSensor())
print(advisor.advice(forPlantNamed: "Fern"))


//:  Run the page two or three times. In a comment, explain why you can't know ahead of time what it will print.


// Answer: The live sensor returns a random number from 0 through 100.
// Different readings can choose different branches on each run.


//:  Write a protocol called `MoistureSensor` with one requirement: a method called `readMoisturePercent(forPlantNamed:)` that takes a `String` and returns an `Int`. Then make `LiveMoistureSensor` conform to it.
protocol MoistureSensor {
    func readMoisturePercent(forPlantNamed plantName: String) -> Int
}





//:  `WateringAdvisor` builds its own `LiveMoistureSensor`, so it can never use anything else. Change the `sensor` property so its type is `MoistureSensor` and it has no starting value. Because `WateringAdvisor` is a struct, it now gets an initializer that takes a `sensor`. Update the line that creates `advisor` so it passes in a `LiveMoistureSensor()`. Run the page and check that it still works.





//:  The pots also have a backup sensor. Write a struct called `BackupMoistureSensor` that conforms to `MoistureSensor`. Its `readMoisturePercent(forPlantNamed:)` should print that it is reading the backup sensor, then return `Int.random(in: 0...100)`. Create a second `WateringAdvisor` called `backupAdvisor` that uses it, and print its advice for "Basil". You should not need to change `WateringAdvisor` at all.
struct BackupMoistureSensor: MoistureSensor {
    func readMoisturePercent(forPlantNamed plantName: String) -> Int {
        print("Reading the backup sensor in \(plantName)'s pot...")
        return Int.random(in: 0...100)
    }
}

let backupAdvisor = WateringAdvisor(sensor: BackupMoistureSensor())
print(backupAdvisor.advice(forPlantNamed: "Basil"))





/*:
 [Previous](@previous)  |  page 6 of 8  |  [Next: Exercise - Fake Types](@next)
 */

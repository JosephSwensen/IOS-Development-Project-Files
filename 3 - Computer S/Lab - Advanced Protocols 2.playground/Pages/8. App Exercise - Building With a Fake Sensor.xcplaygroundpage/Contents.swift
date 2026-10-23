/*:
## App Exercise - Building With a Fake Sensor

 >These exercises reinforce Swift concepts in the context of a plant care app.

 The sensor hardware isn't ready yet, but the team needs the advice messages finished this week. Below is a finished version of the code from the Passing In a Sensor page.
 */


protocol MoistureSensor {
    func readMoisturePercent(forPlantNamed plantName: String) -> Int
}

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


//:  Write a struct called `FakeMoistureSensor` that conforms to `MoistureSensor`. Give it a property called `moisturePercentToReturn` of type `Int`, and have `readMoisturePercent(forPlantNamed:)` return it.
struct FakeMoistureSensor: MoistureSensor {
    let moisturePercentToReturn: Int

    func readMoisturePercent(forPlantNamed plantName: String) -> Int {
        return moisturePercentToReturn
    }
}





//:  Using fakes, print the advice for "Fern" at readings of 10, 50 and 95. You should see all three messages. With the live sensor, you could run the page many times and never see one of them.
for reading in [10, 50, 95] {
    let sensor = FakeMoistureSensor(moisturePercentToReturn: reading)
    let advisor = WateringAdvisor(sensor: sensor)
    print(advisor.advice(forPlantNamed: "Fern"))
}





//:  `advice(forPlantNamed:)` changes its answer at 30 and at 80. In a comment, predict what it says at 29, 30, 80 and 81. Then write a `for`-`in` loop over `[29, 30, 80, 81]`. For each reading, make a `FakeMoistureSensor` and a `WateringAdvisor`, and print the reading and the advice for "Fern". Check your predictions.


// 29: Water Fern today.
// 30: Fern is fine.
// 80: Fern is fine.
// 81: Fern is too wet. Skip watering.
for reading in [29, 30, 80, 81] {
    let sensor = FakeMoistureSensor(moisturePercentToReturn: reading)
    let advisor = WateringAdvisor(sensor: sensor)
    print("\(reading): \(advisor.advice(forPlantNamed: "Fern"))")
}


//:  When the hardware is ready, you'll want to switch to the real sensor by changing one line. Create a constant called `useFakeSensor` and set it to `true`. Create a variable called `sensor` of type `MoistureSensor` and set it to a `LiveMoistureSensor()`. Then use an `if` statement to set `sensor` to a `FakeMoistureSensor` with a reading of 50 when `useFakeSensor` is `true`. Create a `WateringAdvisor` with `sensor` and print its advice for "Basil". Run the page once with `useFakeSensor` set to `true` and once with it set to `false`, and observe the printout.
let useFakeSensor = true
var sensor: MoistureSensor = LiveMoistureSensor()
if useFakeSensor {
    sensor = FakeMoistureSensor(moisturePercentToReturn: 50)
}
let advisor = WateringAdvisor(sensor: sensor)
print(advisor.advice(forPlantNamed: "Basil"))





//:  In a comment, explain how the fake sensor let you finish the advice messages before the real sensor was ready.


// Answer: The fake conforms to the same protocol as the real sensor, so
// WateringAdvisor can use it without changes.


/*:
 [Previous](@previous)  |  page 8 of 8
 */

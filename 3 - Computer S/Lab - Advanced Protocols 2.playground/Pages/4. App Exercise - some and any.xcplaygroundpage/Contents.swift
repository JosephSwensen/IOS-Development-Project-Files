/*:
## App Exercise - some and any

 >These exercises reinforce Swift concepts in the context of a plant care app.

 This page has its own copy of `Plant`, `Fern` and `Cactus`. Remember: `some Plant` means one specific type that conforms to `Plant`, and Swift knows which one. `any Plant` means a value that can be any conforming type, and which type it is can change.
 */


protocol Plant {
    var name: String { get }
    var daysBetweenWatering: Int { get }
    func careTip() -> String
}

struct Fern: Plant {
    let name: String
    let daysBetweenWatering = 3

    func careTip() -> String {
        return "Keep \(name) out of direct sun."
    }
}

struct Cactus: Plant {
    let name: String
    let daysBetweenWatering = 14

    func careTip() -> String {
        return "Let the soil around \(name) dry out completely."
    }
}


//:  Write a function called `makeStarterPlant()` that returns `some Plant`. It should return a `Fern` named "Starter Fern". Call it, store the result in a constant called `starterPlant`, and print its `name` and `careTip()`.
func makeStarterPlant() -> some Plant {
    return Fern(name: "Starter Fern")
}

let starterPlant = makeStarterPlant()
print(starterPlant.name)
print(starterPlant.careTip())





//:  The function below does not build. Uncomment it by deleting the `//` at the start of each line, then read the error. Fix it by changing only the return type. Then call it once with `true` and once with `false`, and print the name of each plant it returns.


func recommendedPlant(forSunnyWindow isSunny: Bool) -> any Plant {
    if isSunny {
        return Cactus(name: "Window Cactus")
    } else {
        return Fern(name: "Shade Fern")
    }
}

print(recommendedPlant(forSunnyWindow: true).name)
print(recommendedPlant(forSunnyWindow: false).name)


//:  In a comment, explain why `some Plant` did not work for `recommendedPlant(forSunnyWindow:)`, and why your fix does.


// Answer: it was fixed to just one type to return and my fix works becasue it lets the return be anything that comforms to plant


//:  Create a variable called `plantOfTheWeek` of type `any Plant` and set it to a `Cactus`. Print its name. Then set it to a `Fern` and print its name again. Observe the printout.
var plantOfTheWeek: any Plant = Cactus(name: "Desert Cactus")
print(plantOfTheWeek.name)
plantOfTheWeek = Fern(name: "Forest Fern")
print(plantOfTheWeek.name)





//:  Every SwiftUI view you've written has `var body: some View`. In a comment, explain in your own words why SwiftUI uses `some View` there and not `any View`.


// Answer: so it has just one type and not any type becasue any is not really type safe


/*:
 [Previous](@previous)  |  page 4 of 8  |  [Next: Exercise - Small Protocols](@next)
 */

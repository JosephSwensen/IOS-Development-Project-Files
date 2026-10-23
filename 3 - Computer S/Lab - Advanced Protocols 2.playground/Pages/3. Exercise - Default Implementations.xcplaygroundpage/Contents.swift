/*:
## Exercise - Default Implementations

 A protocol extension can give a requirement a default body. Every conforming type gets it without writing it. A type can still write its own version, and its own version is used instead of the default.
 */


protocol Announceable {
    var eventName: String { get }
    var startTime: String { get }
    func announce()
    var isFree: Bool { get }
}

struct Concert: Announceable {
    let isFree = false
    let eventName: String
    let startTime: String
}

struct Lecture: Announceable {
    let eventName: String
    let startTime: String
}

struct Workshop: Announceable {
    let eventName: String
    let startTime: String

    func announce() {
        print("\(eventName) starts at \(startTime).")
        print("Bring your laptop.")
    }
}

let springConcert = Concert(eventName: "Spring Concert", startTime: "7:00 PM")
let guestLecture = Lecture(eventName: "Guest Lecture: App Design", startTime: "10:00 AM")
let solderingWorkshop = Workshop(eventName: "Soldering Workshop", startTime: "2:30 PM")

springConcert.announce()
guestLecture.announce()
solderingWorkshop.announce()


//:  All three structs write the exact same `announce()`. Write an extension on `Announceable` that gives `announce()` a default implementation with the same `print`. Then delete `announce()` from all three structs. Run the page and check that the printout has not changed.
extension Announceable {
    func announce() {
        print("\(eventName) starts at \(startTime).")
    }

    var isFree: Bool {
        return true
    }
}





//:  Workshops need one more line. Give `Workshop` its own `announce()` that prints the same line as the default, then prints "Bring your laptop." Run the page and observe the printout.





//:  In a comment, say which version of `announce()` runs for each of the three events, and why.


// springConcert: Uses the default announce() from the protocol extension.
// guestLecture: Also uses the default because Lecture has no custom announce().
// solderingWorkshop: Uses its own announce(), which adds the laptop reminder.


//:  Add a new requirement to `Announceable`: `var isFree: Bool { get }`. The page will stop building, because no struct has `isFree` yet. Instead of adding it to all three structs, give `isFree` a default in your extension that returns `true`. Then give `Concert` its own `isFree` that is `false`. Print `isFree` for all three events and observe the printout.
print(springConcert.isFree)
print(guestLecture.isFree)
print(solderingWorkshop.isFree)





//:  Now write one from scratch. Write a protocol called `Alarm` with two requirements: a property called `label` of type `String` that can be read, and a method called `ring()`.
protocol Alarm {
    var label: String { get }
    func ring()
}





//:  Write an extension on `Alarm` that gives `ring()` a default. It should print the label followed by "Beep beep!", like "Morning Alarm: Beep beep!"
extension Alarm {
    func ring() {
        print("\(label): Beep beep!")
    }
}





//:  Write a struct called `KitchenTimer` that conforms to `Alarm` and uses the default `ring()`. Then write a struct called `RoosterAlarm` that conforms to `Alarm` and writes its own `ring()` that prints the label followed by "Cock-a-doodle-doo!" Create one of each, call `ring()` on both, and observe the printout.
struct KitchenTimer: Alarm {
    let label: String
}

struct RoosterAlarm: Alarm {
    let label: String

    func ring() {
        print("\(label): Cock-a-doodle-doo!")
    }
}

let kitchenTimer = KitchenTimer(label: "Pasta Timer")
let roosterAlarm = RoosterAlarm(label: "Morning Alarm")
kitchenTimer.ring()
roosterAlarm.ring()





/*:
 [Previous](@previous)  |  page 3 of 8  |  [Next: App Exercise - some and any](@next)
 */

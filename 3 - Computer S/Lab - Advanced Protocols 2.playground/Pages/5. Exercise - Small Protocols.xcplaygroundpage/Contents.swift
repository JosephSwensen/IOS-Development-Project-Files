/*:
## Exercise - Small Protocols

 A type can conform to more than one protocol. List them after the colon, separated by commas. That lets you write several small protocols instead of one big one, so each type only promises what it can actually do.
 */


protocol Calling {
    func makeCall(to contactName: String)
}

protocol PhotoTaking {
    func takePhoto()
}

protocol MusicPlaying {
    func playSong(named songName: String)
}

struct Phone: Calling, PhotoTaking, MusicPlaying {
    let modelName: String
    var batteryPercent: Int

    func makeCall(to contactName: String) {
        print("\(modelName) is calling \(contactName).")
    }

    func takePhoto() {
        print("\(modelName) took a photo.")
    }

    func playSong(named songName: String) {
        print("\(modelName) is playing \(songName).")
    }
}

struct DigitalCamera: PhotoTaking {
    let modelName: String
    var batteryPercent: Int

    func takePhoto() {
        print("\(modelName) took a photo.")
    }

}

struct BluetoothSpeaker: MusicPlaying {
    let modelName: String

    func playSong(named songName: String) {
        print("\(modelName) is playing \(songName).")
    }
}

let myPhone = Phone(modelName: "Pocket Phone", batteryPercent: 64)
let travelCamera = DigitalCamera(modelName: "Trail Cam", batteryPercent: 20)
let partySpeaker = BluetoothSpeaker(modelName: "Boom Box")

myPhone.makeCall(to: "Grandma")
myPhone.takePhoto()
travelCamera.takePhoto()
partySpeaker.playSong(named: "Happy Birthday")


//:  `DigitalCamera` and `BluetoothSpeaker` have to write empty functions to conform to `Gadget`. Split `Gadget` into three protocols: `Calling` with `makeCall(to:)`, `PhotoTaking` with `takePhoto()`, and `MusicPlaying` with `playSong(named:)`. Delete `Gadget`. Make each struct conform only to the protocols it needs, and delete the empty functions. Run the page and check that the printout has not changed.





//:  Write a protocol called `BatteryPowered` with one requirement: a method called `batteryReport()` that returns a `String`.
protocol BatteryPowered {
    func batteryReport() -> String
}





//:  You can add a protocol to a type in an extension. Write an extension that makes `Phone` conform to `BatteryPowered`. Its `batteryReport()` should return a sentence with the model name and battery percent. Write a second extension that does the same for `DigitalCamera`. Print `batteryReport()` for both and observe the printout.
extension Phone: BatteryPowered {
    func batteryReport() -> String {
        return "\(modelName) has \(batteryPercent)% battery remaining."
    }
}

extension DigitalCamera: BatteryPowered {
    func batteryReport() -> String {
        return "\(modelName) has \(batteryPercent)% battery remaining."
    }
}

print(myPhone.batteryReport())
print(travelCamera.batteryReport())





//:  Write a function called `recordVideo(using:songName:)`. The type of its first parameter is `PhotoTaking & MusicPlaying`, and its second parameter is a `String`. Inside, call `takePhoto()` and then `playSong(named:)`. Call it with `myPhone` and observe the printout.
func recordVideo(using device: PhotoTaking & MusicPlaying, songName: String) {
    device.takePhoto()
    device.playSong(named: songName)
}

recordVideo(using: myPhone, songName: "Happy Birthday")





//:  Try calling `recordVideo(using:songName:)` with `travelCamera`. Read the error, then delete that line. In a comment, explain what the error is telling you.


// Answer: The argument must conform to both PhotoTaking and MusicPlaying.
// DigitalCamera only conforms to PhotoTaking, so it cannot be passed.


/*:
 [Previous](@previous)  |  page 5 of 8  |  [Next: App Exercise - Passing In a Sensor](@next)
 */

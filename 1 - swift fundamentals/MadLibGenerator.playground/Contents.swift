import UIKit

@MainActor
struct MadLibGenerator {
    var verb1: String
    var verb2: String
    var noun: String
    var bug: String
    var emotion: String
    var favCar: String
    var food: String
    var building: String
    var selectedStoryNumber: Int = MadLibGenerator.randomStoryNumber()
    
    static var storyCount: Int = 3
    
    static func randomStoryNumber() -> Int {
        Int.random(in: 1...3)
    }
    
    var hasValidInput: Bool {
        if verb1 != "" && verb2 != "" && noun != "" && bug != "" && emotion != "" && favCar != "" && food != "" && building != ""{
            return true
        } else {
            return false
        }
    }
        
        func generateMadLib() -> String {
            if hasValidInput {
                return """
        The Weirdest Day Ever One morning, I woke up feeling very \(verb1). I looked out the window and saw a \(bug) riding a \(favCar) down the street. I quickly grabbed my \(food) and ran outside. The animal looked at me and yelled, “\(verb2)!” Suddenly, \(noun) giant \(building) appeared from behind a \(noun). They started \(verb1) everywhere. I knew I had to do something, so I used my secret power of \(building). Everyone stopped and stared. Then the animal gave me a \(noun) and said, “You just saved \(favCar)!” I went back home, ate \(food), and decided it was the most \(verb2) day of my life. 
        """
            } else {
                return "Invalid input"
            }
            
            switch selectedStoryNumber {
            case 1:
            case 2:
            case 3:
            }
            
        }
    }


let madLibGenerator = MadLibGenerator(verb1: "jump", verb2: "sit", noun: "italy", bug: "caterpiler", emotion: "sad", favCar: "honda acorrd", food: "pizza", building: "hosue")
let madLib = madLibGenerator.generateMadLib()
print(madLib)

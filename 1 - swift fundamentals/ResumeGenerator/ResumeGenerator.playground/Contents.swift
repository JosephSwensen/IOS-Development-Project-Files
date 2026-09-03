import UIKit

@MainActor
struct ResumeGenerator {
    var YourName: String
    var studentOrJobTitle: String
    var skillsOrAreaOfExperience: String
    var careerOrFieldOfInterest: String
    var hobbiesOrInterests: String
    var strength1: String
    var strength2: String
    var strength3: String
    var careerFieldOrGoal: String
    
    static var formatNumber: Int = ResumeGenerator.randomStoryNumber()
    static var formatCount: Int = 3
    static var formatTitle: String {
        if formatNumber == 1 {
            return "you got format 1"
        } else if formatNumber == 2 {
            return "you got format 2"
        } else {
            return "you got format 3"
        }
    }
    
    static func randomStoryNumber() -> Int {
        Int.random(in: 1...formatCount)
    }
    
    
    
    var hasValidInput: Bool {
        !(YourName.isEmpty || studentOrJobTitle.isEmpty || skillsOrAreaOfExperience.isEmpty || careerFieldOrGoal.isEmpty || careerOrFieldOfInterest.isEmpty || hobbiesOrInterests.isEmpty || strength1.isEmpty || strength2.isEmpty || strength3.isEmpty)
    }
    
    func generateResume() -> String {
        if !hasValidInput {
            print("error")
        }
        
        
        switch ResumeGenerator.formatNumber {
        case 1:
                return """
Hi, my name is \(YourName). I am a \(studentOrJobTitle) with experience in \(skillsOrAreaOfExperience). I am interested in \(careerOrFieldOfInterest) and enjoy \(hobbiesOrInterests). My strengths include \(strength1), \(strength2), and \(strength3). I am looking for opportunities to improve my skills and gain experience in \(careerFieldOrGoal).
"""
        case 2:
               return """
                \(YourName) is a \(studentOrJobTitle) with experience in \(skillsOrAreaOfExperience). They are interested in pursuing \(careerOrFieldOfInterest) and enjoy \(hobbiesOrInterests). Their strengths include \(strength1), \(strength2), and \(strength3). Their goal is to continue developing their abilities and gain experience in \(careerFieldOrGoal).
                """
        case 3:
               return """
                My name is \(YourName), and I am currently a \(studentOrJobTitle). I have experience with \(skillsOrAreaOfExperience) and have a strong interest in \(careerOrFieldOfInterest). Outside of work and school, I enjoy \(hobbiesOrInterests). I would describe my main strengths as \(strength1), \(strength2), and \(strength3). I hope to grow my skills and pursue opportunities in \(careerFieldOrGoal).
                """
        default:
            return "error"
        }
        
    }
}
    


let resumeGenerator = ResumeGenerator(YourName: "Joey", studentOrJobTitle: "Student", skillsOrAreaOfExperience: "Swift programming", careerOrFieldOfInterest: "iOS development", hobbiesOrInterests: "tennis and coding", strength1: "hardworking", strength2: "creative", strength3: "reliable", careerFieldOrGoal: "software development")
let resume = resumeGenerator.generateResume()
print(resume)

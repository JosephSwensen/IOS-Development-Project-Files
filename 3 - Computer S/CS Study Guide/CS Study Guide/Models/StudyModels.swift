import Foundation

struct QuestionAnswer: Identifiable {
    let id: String
    let question: String
    let answer: String
}

struct Topic: Identifiable {
    let id: String
    let title: String
    let icon: String
    let summary: String
    let questions: [QuestionAnswer]
    let example: String
}

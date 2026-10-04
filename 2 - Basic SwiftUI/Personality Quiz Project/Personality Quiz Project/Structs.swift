//
//  Structs.swift
//  Personality Quiz Project
//
//  Created by Joseph Swensen on 9/30/26.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer: Hashable {
    var text: String
    var type: CondimentType

}

enum CondimentType: String {
    case ketchup = "Ketchup"
    case ranch = "Ranch"
    case hotSauce = "Hot Sauce"
    case honeyMustard = "Honey Mustard"
}

let questionList: [Question] = [
    Question(
        text: "What sounds like the best weekend?",
        type: .single,
        answers: [
            Answer(text: "Hanging out with friends", type: .ketchup),
            Answer(text: "Staying home and relaxing", type: .ranch),
            Answer(text: "Trying something crazy", type: .hotSauce),
            Answer(text: "Going somewhere new", type: .honeyMustard)
        ]
    ),

    Question(
        text: "Which words describe you?",
        type: .multiple,
        answers: [
            Answer(text: "Friendly", type: .ketchup),
            Answer(text: "Funny", type: .ranch),
            Answer(text: "Bold", type: .hotSauce),
            Answer(text: "Chill", type: .honeyMustard)
        ]
    ),

    Question(
        text: "How adventurous are you?",
        type: .ranged,
        answers: [
            Answer(text: "I like keeping things simple", type: .ketchup),
            Answer(text: "I'll try some new things", type: .ranch),
            Answer(text: "I like being adventurous", type: .hotSauce),
            Answer(text: "I'll try basically anything", type: .honeyMustard)
        ]
    )
]

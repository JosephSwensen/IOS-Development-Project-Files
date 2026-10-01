//
//  5Structs.swift
//  Personality Quiz Project
//
//  Created by Joseph Swensen on 9/30/26.
//

import SwiftUI


struct QuestionFlowView: View {
    @State var questionIndex: Int
    @Binding var selectedAnswers: [Answer]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(verbatim: "\(questionList[questionIndex])")
                let currentQuestion = questionList[questionIndex]
                switch currentQuestion.type {
                case .single:
                    SingleResponseSubview(question: currentQuestion, selectedAnswers: $selectedAnswers)
                case .multiple:
                    MultipleResponseSubview(question: currentQuestion, selectedAnswers: $selectedAnswers)
                case .ranged:
                    RangedResponseSubview(question: currentQuestion, selectedAnswers: $selectedAnswers)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    if questionIndex >= 3 {
                        NavigationLink("next") {
                            ResultsView(userAnswers: selectedAnswers)
                        }
                        
                    } else if questionIndex == 0 {
                        HStack {
                            NavigationLink("next") {
                                QuestionFlowView(questionIndex: 1, selectedAnswers: $selectedAnswers)
                            }
                        }
                    } else if questionIndex == 1 {
                        HStack {
                            NavigationLink("next") {
                                QuestionFlowView(questionIndex: 2, selectedAnswers: $selectedAnswers)
                                
                            }
                        }
                    } else if questionIndex == 2 {
                        HStack {
                            NavigationLink("next") {
                                QuestionFlowView(questionIndex: 3, selectedAnswers: $selectedAnswers)
                            }
                        }
                    }
                }
            }
        }
        
    }
}


struct SingleResponseSubview: View {
    @State var selected: Answer = Answer(text: "Default", type: .ketchup)
    let question: Question
    @Binding var selectedAnswers: [Answer]
    
    var body: some View {
        Picker("Select an Answer", selection: $selected) {
            ForEach(question.answers, id: \.self) { answer in
                Text(answer.text).tag(answer as Answer)
            }
        }
        Button("Save Answer") {
            switch selected {
            case selected:
                selectedAnswers.append(selected)
            default:
                print("Error")
            }
        }
    }
}

struct MultipleResponseSubview: View {
    let question: Question
    @Binding var selectedAnswers: [Answer]
    @State var toggle1: Bool = false
    @State var toggle2: Bool = false
    @State var toggle3: Bool = false
    @State var toggle4: Bool = false
    
    var body: some View {
        Toggle("\(question.answers[0].text)", isOn: $toggle1)
        Toggle("\(question.answers[1].text)", isOn: $toggle2)
        Toggle("\(question.answers[2].text)", isOn: $toggle3)
        Toggle("\(question.answers[3].text)", isOn: $toggle4)
        
        Button("Save answer") {
            if toggle1 == true {
                selectedAnswers.append(question.answers[0])
            }
            if toggle2 == true {
                selectedAnswers.append(question.answers[1])
            }
            if toggle3 == true {
                selectedAnswers.append(question.answers[2])
            }
            if toggle4 == true {
                selectedAnswers.append(question.answers[3])
            }
        }
    }
}

struct RangedResponseSubview: View {
    let question: Question
    @State var sliderValue: Float = 0
    var convert: Int {
        let converedValue = Int(sliderValue)
        return converedValue
    }
    
    @Binding var selectedAnswers: [Answer]
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0...3, step: 1)
            HStack {
                Text(verbatim: "\(question.answers[convert])")
            }
        }
        Button("Save Answer") {
            selectedAnswers.append(question.answers[convert])
        }
        
    }
}

enum resultError: Error {
    case userHasNotAnsweredAnything
    
}

struct ResultsView: View {
    let userAnswers: [Answer]
    var resultText: String {
        do {
            let result = try calculateResult(userAnswers: userAnswers)
            return "\(result)"
        } catch {
            return "Error calculating result. go back and answer some questions"
        }
    }
    
    func calculateResult(userAnswers: [Answer]) throws -> CondimentType {
        
        var tallyK = 0
        var tallyR = 0
        var tallyH = 0
        var tallyHM = 0
        
        for answer in userAnswers {
            switch answer.type {
            case .ketchup: tallyK += 1
            case .ranch: tallyR += 1
            case .hotSauce: tallyH += 1
            case .honeyMustard: tallyHM += 1
            }
        }
        
        if tallyK > tallyR && tallyK > tallyH && tallyK > tallyHM {
            return .ketchup
        } else if tallyR > tallyK && tallyR > tallyH && tallyR > tallyHM {
            return .ranch
        } else if tallyH > tallyR && tallyH > tallyK && tallyH > tallyHM {
            return .hotSauce
        } else {
            return .honeyMustard
        }
        
        
        
    }
    
    var body: some View {
        Text(resultText)
        
    }
}



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
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.93)
                .ignoresSafeArea()
            
            Image("background")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            
            VStack {
                Text(verbatim: "\(questionList[questionIndex].text)")
                    .font(.title)
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
                    if questionIndex == 0 {
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
                    } else {
                        NavigationLink("next") {
                            ResultsView(userAnswers: selectedAnswers)
                        }
                        
                    }
                }
            }
        }
    }
}



// -----------------------------------------------------------------------------


struct SingleResponseSubview: View {
    @State var selected: Answer = Answer(text: "Default", type: .ketchup)
    let question: Question
    @Binding var selectedAnswers: [Answer]
    @State var singleSaveButton: Bool = false
    
    var body: some View {
        
        Picker("Select an Answer", selection: $selected) {
            ForEach(question.answers, id: \.self) { answer in
                Text(answer.text).tag(answer as Answer)
            }
        }
        
        HStack {
            Button("Save Answer") {
                singleSaveButton = true
                selectedAnswers.append(selected)
            }
            .disabled(singleSaveButton)
            
            Button {
                singleSaveButton = false
                selectedAnswers.removeLast()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            .disabled(!singleSaveButton)
        }
    }
}

// -----------------------------------------------------------------------------

struct MultipleResponseSubview: View {
    let question: Question
    @Binding var selectedAnswers: [Answer]
    
    @State var toggle1: Bool = false
    @State var toggle2: Bool = false
    @State var toggle3: Bool = false
    @State var toggle4: Bool = false
    @State var multipleSaveButton: Bool = false
    
    var body: some View {
        VStack {
            
            Toggle("\(question.answers[0].text)", isOn: $toggle1)
                .fixedSize()
            
            Toggle("\(question.answers[1].text)", isOn: $toggle2)
                .fixedSize()
            
            Toggle("\(question.answers[2].text)", isOn: $toggle3)
                .fixedSize()
            
            Toggle("\(question.answers[3].text)", isOn: $toggle4)
                .fixedSize()
            
            HStack {
                Spacer()
                
                Button("Save answer") {
                    multipleSaveButton = true
                    
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
                .disabled(multipleSaveButton)
                
                Button {
                    multipleSaveButton = false
                    selectedAnswers.removeLast()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
                .disabled(!multipleSaveButton)
                
                Spacer()
            }
        }
    }
}

// -----------------------------------------------------------------------------

struct RangedResponseSubview: View {
    @State var rangedSaveButton: Bool = false
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
                Text(verbatim: "\(question.answers[convert].text)")
                    .font(.title2)
                    .padding(15)
            }
        }
        HStack {
            
            Button("Save Answer") {
                rangedSaveButton = true
                selectedAnswers.append(question.answers[convert])
            }
            .disabled(rangedSaveButton)
            
            Button {
                rangedSaveButton = false
                selectedAnswers.removeLast()
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            .disabled(!rangedSaveButton)
        }
    }
}

enum resultError: Error {
    case userHasNotAnsweredAnything
    
}

// -----------------------------------------------------------------------------

struct ResultsView: View {
    let userAnswers: [Answer]
    
    var final: CondimentType {
        calculateResult(userAnswers: userAnswers)
    }
    
    var description: String {
        switch final {
        case .ketchup:
            return "You’re classic, dependable, and somehow get along with almost everyone."
            
        case .ranch:
            return "You’re fun, a little chaotic, and always make things more interesting."
            
        case .hotSauce:
            return "You’re bold, confident, and bring the excitement wherever you go."
            
        case .honeyMustard:
            return "You’re sweet, chill, and just a little unexpected."
        }
    }
    
    func calculateResult(userAnswers: [Answer]) -> CondimentType {
        
        var tallyK = 0
        var tallyR = 0
        var tallyH = 0
        var tallyHM = 0
        
        for answer in userAnswers {
            switch answer.type {
            case .ketchup:
                tallyK += 1
                
            case .ranch:
                tallyR += 1
                
            case .hotSauce:
                tallyH += 1
                
            case .honeyMustard:
                tallyHM += 1
            }
        }
        
        if tallyK > tallyR && tallyK > tallyH && tallyK > tallyHM {
            return .ketchup
        } else if tallyR > tallyK && tallyR > tallyH && tallyR > tallyHM {
            return .ranch
        } else if tallyH > tallyR && tallyH > tallyK && tallyH > tallyHM {
            return .hotSauce
        } else if tallyHM > tallyR && tallyHM > tallyK && tallyHM > tallyH {
            return .honeyMustard
        }
        
        return .ketchup
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Your condiment soulmate is:")
                .font(.title2)
            
            Text(final.rawValue)
                .font(.largeTitle)
            
            Text(description)
                .font(.title2)
        }
    }
}




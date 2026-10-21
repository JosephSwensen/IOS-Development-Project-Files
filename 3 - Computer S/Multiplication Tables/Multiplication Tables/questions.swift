//
//  questions.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/12/26.
//


import SwiftUI

struct Questions: View {
    @State var buttonClicked: Bool = false 
    @State var A: Int = 0
    @State var B: Int = 0
    @State var C: Int = 0
    @State var D: Int = 0
    
    @State var questionsIndex: Int = 0
    @State var practiceQuestionsRandomNumbers: [Int] = []
    
    @Binding var mode: Mode
    @Binding var numberOfQuestions: Int
    @Binding var selectedMultiplication: Int
    
    func generateRandomNumbers() {
        let range: ClosedRange<Int>
        
        switch mode {
        case .easy: range = 1...26
        case .medium: range = 21...43
        case .hard: range = 41...89
        }
        
        var numbers = Set<Int>()
        let questionCount = min(numberOfQuestions, range.count)
        
        while numbers.count < questionCount {
            numbers.insert(Int.random(in: range))
        }
        
        var number = Array(numbers)
        number.shuffle()
        practiceQuestionsRandomNumbers = number
    }
    
    func getAnswer(selectedMultiplication: Int, practiceQuestionsRandomNumber: Int) -> Int {
        return selectedMultiplication * practiceQuestionsRandomNumber
    }
    
    func generateButtonAnswers() {
        guard questionsIndex < practiceQuestionsRandomNumbers.count else { return }
        
        let answer = getAnswer(
            selectedMultiplication: selectedMultiplication,
            practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]
        )
        
        var answers = Set<Int>()
        
        let lowerBound = max(1, answer - 20)
        let upperBound = answer + 20
        
        while answers.count < 3 {
            let randomAnswer = Int.random(in: lowerBound...upperBound)
            if randomAnswer != answer {
                answers.insert(randomAnswer)
            }
        }
        
        var finalAnswers = Array(answers)
        finalAnswers.append(answer)
        finalAnswers.shuffle()
        
        A = finalAnswers[0]
        B = finalAnswers[1]
        C = finalAnswers[2]
        D = finalAnswers[3]
    }
    
    var body: some View {
        VStack {
            Spacer()
            if questionsIndex < practiceQuestionsRandomNumbers.count {
                Text("\(selectedMultiplication) X \(practiceQuestionsRandomNumbers[questionsIndex])")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                VStack(spacing: 5) {
                    HStack(spacing: 5) {
                        Button(action: { buttonClicked = true }) {
                            Text("\(A)")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                        
                        Button(action: { buttonClicked = true }) {
                            Text("\(B)")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                    }
                    
                    HStack(spacing: 5) {
                        Button(action: { buttonClicked = true }) {
                            Text("\(C)")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(Color.yellow)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                        
                        Button(action: { buttonClicked = true }) {
                            Text("\(D)")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                    }
                    
                    Button(action: {
                        questionsIndex += 1
                        buttonClicked = false
                        
                        if questionsIndex < practiceQuestionsRandomNumbers.count {
                            generateButtonAnswers()
                        }
                    }) {
                        Text("Next Question")
                            .font(.largeTitle)
                            .frame(width: 350, height: 100)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .padding(.top)
                }
                
                Spacer()
            } else {
                Text("Game Over!")
                    .font(.largeTitle)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            questionsIndex = 0
            generateRandomNumbers()
            if !practiceQuestionsRandomNumbers.isEmpty {
                generateButtonAnswers()
            }
        }
    }
}

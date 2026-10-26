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
    @State var correctAnswerCount: Int = 0
    
    
    @State var resultMessage: String = ""
    @State var resultMessageColor: Color = .clear
    
    @State var questionsIndex: Int = 0
    @State var practiceQuestionsRandomNumbers: [Int] = []
    
    @Binding var mode: Mode
    @Binding var numberOfQuestions: Int
    @Binding var selectedMultiplication: Int
    
    
    func generateRandomNumbers() {
        let range: ClosedRange<Int>
        
        switch mode {
        case .easy: range = 1...20
        case .medium: range = 11...30
        case .hard: range = 21...40
        }
        
        practiceQuestionsRandomNumbers = Array(range.shuffled().prefix(numberOfQuestions))
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
        
        let range: ClosedRange<Int>
        switch mode {
        case .easy: range = 1...20
        case .medium: range = 11...30
        case .hard: range = 21...40
        }

        let incorrectAnswers = range
            .map { selectedMultiplication * $0 }
            .filter { $0 != answer }
            .shuffled()

        var finalAnswers = Array(incorrectAnswers.prefix(3))
        finalAnswers.append(answer)
        finalAnswers.shuffle()
        
        A = finalAnswers[0]
        B = finalAnswers[1]
        C = finalAnswers[2]
        D = finalAnswers[3]
    }
    
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.2, blue: 0.0)
                .ignoresSafeArea()
            VStack {
                Spacer()
                if questionsIndex < practiceQuestionsRandomNumbers.count {
                    ZStack {
                        Rectangle()
                            .frame(width: 200, height: 150)
                            .cornerRadius(10)
                            .foregroundStyle(.black)
                        
                        Rectangle()
                            .frame(width: 150, height: 100)
                            .cornerRadius(10)
                            .foregroundStyle(.green)
                        Text("\(selectedMultiplication) X \(practiceQuestionsRandomNumbers[questionsIndex])")
                            .font(.largeTitle)
                            .padding()
                    }
                    
                    Spacer()
                    Spacer()
                    Text(resultMessage)
                        .foregroundStyle(resultMessageColor)
                        .font(.largeTitle)
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 5) {
                        HStack(spacing: 5) {
                            Button(action: {
                                guard !buttonClicked,
                                      questionsIndex < practiceQuestionsRandomNumbers.count else { return }
                                buttonClicked = true
                                if A == getAnswer(
                                    selectedMultiplication: selectedMultiplication,
                                    practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]) {
                                    resultMessage = "Correct!!!"
                                    resultMessageColor = .green
                                    correctAnswerCount += 1
                                } else {
                                    resultMessage = "Incorrect!!!"
                                    resultMessageColor = .red
                                }
                                
                            }) {
                                Text("\(A)")
                                    .font(.largeTitle)
                                    .frame(width: 175, height: 100)
                                    .background(!buttonClicked ? Color.red : Color.gray.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            .disabled(buttonClicked)
                            
                            Button(action: {
                                guard !buttonClicked,
                                      questionsIndex < practiceQuestionsRandomNumbers.count else { return }
                                buttonClicked = true
                                if B == getAnswer(
                                    selectedMultiplication: selectedMultiplication,
                                    practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]) {
                                    resultMessage = "Correct!!!"
                                    resultMessageColor = .green
                                    correctAnswerCount += 1
                                } else {
                                    resultMessage = "Incorrect!!!"
                                    resultMessageColor = .red
                                }
                                
                            }) {
                                Text("\(B)")
                                    .font(.largeTitle)
                                    .frame(width: 175, height: 100)
                                    .background(!buttonClicked ? Color.blue : Color.gray.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            .disabled(buttonClicked)
                        }
                        
                        HStack(spacing: 5) {
                            Button(action: {
                                guard !buttonClicked,
                                      questionsIndex < practiceQuestionsRandomNumbers.count else { return }
                                buttonClicked = true
                                if C == getAnswer(
                                    selectedMultiplication: selectedMultiplication,
                                    practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]) {
                                    resultMessage = "Correct!!!"
                                    resultMessageColor = .green
                                    correctAnswerCount += 1
                                } else {
                                    resultMessage = "Incorrect!!!"
                                    resultMessageColor = .red
                                }
                                
                            }) {
                                Text("\(C)")
                                    .font(.largeTitle)
                                    .frame(width: 175, height: 100)
                                    .background(!buttonClicked ? Color.yellow : Color.gray.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            .disabled(buttonClicked)
                            
                            Button(action: {
                                guard !buttonClicked,
                                      questionsIndex < practiceQuestionsRandomNumbers.count else { return }
                                buttonClicked = true
                                if D == getAnswer(
                                    selectedMultiplication: selectedMultiplication,
                                    practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]) {
                                    resultMessage = "Correct!!!"
                                    resultMessageColor = .green
                                    correctAnswerCount += 1
                                } else {
                                    resultMessage = "Incorrect!!!"
                                    resultMessageColor = .red
                                }
                                
                            }) {
                                Text("\(D)")
                                    .font(.largeTitle)
                                    .frame(width: 175, height: 100)
                                    .background(!buttonClicked ? Color.green : Color.gray.opacity(0.8))
                                    .foregroundColor(.white)
                                    .cornerRadius(40)
                            }
                            .disabled(buttonClicked)
                        }
                        
                        Button(action: {
                            guard buttonClicked,
                                  questionsIndex < practiceQuestionsRandomNumbers.count else { return }
                            questionsIndex += 1
                            buttonClicked = false
                            resultMessage = ""
                            resultMessageColor = .clear
                            
                            if questionsIndex < practiceQuestionsRandomNumbers.count {
                                generateButtonAnswers()
                            }
                        }) {
                            Text("Next Question")
                                .font(.largeTitle)
                                .frame(width: 350, height: 100)
                                .background(buttonClicked ? Color.blue : Color.gray.opacity(0.8))
                                .foregroundColor(.white)
                                .cornerRadius(40)
                        }
                        .padding(.top)
                        .disabled(!buttonClicked)
                    }
                } else {
                    ZStack {
                        Rectangle()
                            .frame(width: 200, height: 150)
                            .cornerRadius(10)
                            .foregroundStyle(.black)
                        
                        Rectangle()
                            .frame(width: 150, height: 100)
                            .cornerRadius(10)
                            .foregroundStyle(.green)
                        Text("""
SCORE:
  \(correctAnswerCount) / \( numberOfQuestions)
""")
                        .font(.largeTitle)
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .onAppear {
                buttonClicked = false
                correctAnswerCount = 0
                resultMessage = ""
                resultMessageColor = .clear
                questionsIndex = 0
                generateRandomNumbers()
                if !practiceQuestionsRandomNumbers.isEmpty {
                    generateButtonAnswers()
                }
            }
        }
    }
}

//
//  questions.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/12/26.
//

import SwiftUI

struct Questions: View {
    var mode: Mode = .easy
    @State var questionsIndex: Int = 0
    @State var practiceQuestionsRandomNumbers: [Int] = []
    
    @Binding var numberOfQuestions: Int
    @Binding var selectedMultiplication: Int
    
    func generateRandomNumbers() {
        let range: ClosedRange<Int>
        
        switch mode {
        case .easy: range = 1...5
        case .medium: range = 6...11
        case .hard: range = 12...17
        }
        
        var numbers: [Int] = []
        for _ in 1...numberOfQuestions {
            numbers.append(Int.random(in: range))
        }
        practiceQuestionsRandomNumbers = numbers
    }
    
    var body: some View {
        VStack {
            if questionsIndex < practiceQuestionsRandomNumbers.count {
                Text("\(selectedMultiplication) X \(practiceQuestionsRandomNumbers[questionsIndex])")
                    .font(.largeTitle)
            } else {
                Text("Game Over!")
                    .font(.largeTitle)
            }
            
            
            
            if questionsIndex < practiceQuestionsRandomNumbers.count {
                Button("Next Question") {
                    questionsIndex += 1
                }
                .padding()
            }
        }
        .onAppear {
            generateRandomNumbers()
        }
    }
}

//
//  questions.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/12/26.
//


import SwiftUI

struct Questions: View {
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

        // Prevent asking for more unique numbers than exist
        let questionCount = min(numberOfQuestions, range.count)

        while numbers.count < questionCount {
            numbers.insert(Int.random(in: range))
        }

        var number = Array(numbers)
        number.shuffle()
        practiceQuestionsRandomNumbers = number
    }

    func getAnswer(selectedMultiplication: Int, practiceQuestionsRandomNumber: Int) -> Int {
        var answer = selectedMultiplication * practiceQuestionsRandomNumber
        return answer
    }

    func generateButtonAnswers() {
        guard questionsIndex < practiceQuestionsRandomNumbers.count else {
            return
        }

        let answer = getAnswer(
            selectedMultiplication: selectedMultiplication,
            practiceQuestionsRandomNumber: practiceQuestionsRandomNumbers[questionsIndex]
        )

        var answers = Set<Int>()

        while answers.count < 4 {
            let randomAnswer = Int.random(in: 1...100)

            if randomAnswer != answer {
                answers.insert(randomAnswer)
            }
        }

        let wrongAnswers = Array(answers)

        A = wrongAnswers[0]
        B = wrongAnswers[1]
        C = wrongAnswers[2]
        D = wrongAnswers[3]

        let randomButtonNumber = Int.random(in: 1...4)

        switch randomButtonNumber {
        case 1:
            A = answer
        case 2:
            B = answer
        case 3:
            C = answer
        case 4:
            D = answer
        default:
            break
        }
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
                VStack {
                    HStack {
                        Button("\(A)") {

                        }

                        Button("\(B)") {

                        }
                    }

                    HStack {
                        Button("\(C)") {

                        }

                        Button("\(D)") {

                        }
                    }

                    Button("Next Question") {
                        questionsIndex += 1

                        if questionsIndex < practiceQuestionsRandomNumbers.count {
                            generateButtonAnswers()
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            questionsIndex = 0
            generateRandomNumbers()
            generateButtonAnswers()
        }
    }
}

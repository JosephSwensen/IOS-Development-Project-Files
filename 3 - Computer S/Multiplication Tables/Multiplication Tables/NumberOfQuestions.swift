//
//  NumberOfQuestions.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct NumberOfQuestions: View {
    @Binding var numberOfQuestions: Int
    @State var numberQuestionsDisabled20: Bool = false
    @State var numberQuestionsDisabled10: Bool = false
    @State var numberQuestionsDisabled5: Bool = false
    
    var body: some View {
        VStack {
            Button("20") {
                numberOfQuestions = 20
                
                numberQuestionsDisabled10 = true
                numberQuestionsDisabled5 = true
            }
            .disabled(numberQuestionsDisabled20)
            
            HStack {
                Button("10") {
                    numberOfQuestions = 10
                    
                    numberQuestionsDisabled20 = true
                    numberQuestionsDisabled5 = true
                }
                .disabled(numberQuestionsDisabled10)
                
                Button("5") {
                    numberOfQuestions = 5
                    
                    numberQuestionsDisabled20 = true
                    numberQuestionsDisabled10 = true
                }
                .disabled(numberQuestionsDisabled5)
            }
        }
    }
}

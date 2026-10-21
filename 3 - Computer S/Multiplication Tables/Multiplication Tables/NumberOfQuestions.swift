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
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        
        VStack {
            Button(action: {
                numberOfQuestions = 20
                
                numberQuestionsDisabled10 = true
                numberQuestionsDisabled5 = true
            }) {
                Text("20")
                    .font(.largeTitle)
                    .frame(width: 350, height: 100)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(40)
            }
            .disabled(numberQuestionsDisabled20)
            
            HStack {
                Button(action: { numberOfQuestions = 10
                    
                    numberQuestionsDisabled20 = true
                    numberQuestionsDisabled5 = true
                }) {
                    Text("10")
                        .font(.largeTitle)
                        .frame(width: 175, height: 100)
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .disabled(numberQuestionsDisabled10)
                
                Button(action: {
                    numberOfQuestions = 5
                    
                    numberQuestionsDisabled20 = true
                    numberQuestionsDisabled10 = true
                }) {
                    Text("5")
                        .font(.largeTitle)
                        .frame(width: 175, height: 100)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .disabled(numberQuestionsDisabled5)
                
            }
        }
    }
}

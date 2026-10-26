//
//  NumberOfQuestions.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct NumberOfQuestions: View {
    @Binding var numberOfQuestions: Int
    @Binding var mode: Mode
    @Binding var selectedMultiplication: Int
    
    @State var buttonClicked = false
    
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.2, blue: 0.0)
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 150)
                        .cornerRadius(10)
                        .foregroundStyle(.black)

                    Rectangle()
                        .frame(width: 250, height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(.green)

                    Text("select number of questions")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                }
                Spacer()
                Spacer()
                
                VStack {
                    Button(action: {
                        numberOfQuestions = 20
                        buttonClicked = true
                    }) {
                        Text("20")
                            .font(.largeTitle)
                            .frame(width: 350, height: 100)
                            .background(buttonClicked ? Color.gray.opacity(0.8) : Color.red)
                            .foregroundStyle(.white)
                            .cornerRadius(40)
                    }
                    .disabled(buttonClicked)

                    HStack {
                        Button(action: {
                            numberOfQuestions = 10
                            buttonClicked = true
                        }) {
                            Text("10")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(buttonClicked ? Color.gray.opacity(0.8) : Color.yellow)
                                .foregroundStyle(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                        Button(action: {
                            numberOfQuestions = 5
                            buttonClicked = true
                        }) {
                            Text("5")
                                .font(.largeTitle)
                                .frame(width: 175, height: 100)
                                .background(buttonClicked ? Color.gray.opacity(0.8) : Color.green)
                                .foregroundStyle(.white)
                                .cornerRadius(40)
                        }
                        .disabled(buttonClicked)
                    }
                }
                
                NavigationLink(destination: PracticeMode(
                    mode: $mode,
                    numberOfQuestions: $numberOfQuestions,
                    selectedMultiplication: $selectedMultiplication
                )) {
                    Text("Next")
                        .font(.largeTitle)
                        .frame(width: 350, height: 100)
                        .background(buttonClicked ? Color.blue : Color.gray.opacity(0.8))
                        .foregroundStyle(.white)
                        .cornerRadius(40)
                }
                .disabled(!buttonClicked)
            }
        }
        
    }
}

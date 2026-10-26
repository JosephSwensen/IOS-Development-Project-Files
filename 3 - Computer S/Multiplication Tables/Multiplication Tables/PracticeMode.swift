//
//  PracticeMode.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

enum Mode {
    case easy
    case medium
    case hard
}

struct PracticeMode: View {
    @State var buttonClicked: Bool = false 
    @Binding var mode: Mode
    @Binding var numberOfQuestions: Int
    @Binding var selectedMultiplication: Int
    
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
                    Text("select difficulty")
                        .font(.largeTitle)
                }
                Spacer()
                Button(action: {
                    buttonClicked = true
                    mode = .medium
                }) {
                    Text("Medium")
                        .font(.largeTitle)
                        .frame(width: 350, height: 100)
                        .background(!buttonClicked ? Color.yellow : Color.gray.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .disabled(buttonClicked)
                
                HStack {
                    Button(action: {
                        buttonClicked = true
                        mode = .easy
                    }) {
                        Text("Easy")
                            .font(.largeTitle)
                            .frame(width: 175, height: 100)
                            .background(!buttonClicked ? Color.green : Color.gray.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .disabled(buttonClicked)
                    
                    Button(action: {
                        buttonClicked = true
                        mode = .hard
                    }) {
                        Text("Hard")
                            .font(.largeTitle)
                            .frame(width: 175, height: 100)
                            .background(!buttonClicked ? Color.red : Color.gray.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .disabled(buttonClicked)
                }
                NavigationLink(destination: Questions(mode: $mode, numberOfQuestions: $numberOfQuestions, selectedMultiplication: $selectedMultiplication)) {
                    Text("Begin")
                        .font(.largeTitle)
                        .frame(width: 350, height: 100)
                        .background(buttonClicked ? Color.blue : Color.gray.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .disabled(!buttonClicked)
            }
        }
    }
}


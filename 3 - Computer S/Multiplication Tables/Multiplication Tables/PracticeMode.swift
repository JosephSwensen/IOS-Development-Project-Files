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
    @State var numberOfQuestions: Int = 5
    @State var selectedMultiplication: Int = 2
    
    var body: some View {
        VStack {
            Button(action: {
                buttonClicked = true
                mode = .medium
            }) {
                Text("Medium")
                    .font(.largeTitle)
                    .frame(width: 350, height: 100)
                    .background(!buttonClicked ? Color.yellow : Color.gray.opacity(0.8))
                    .foregroundColor(!buttonClicked ? Color.white : Color.gray.opacity(0.8))
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
                        .foregroundColor(!buttonClicked ? Color.white : Color.gray.opacity(0.8))
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
                        .foregroundColor(!buttonClicked ? Color.white : Color.gray.opacity(0.8))
                        .cornerRadius(40)
                }
                .disabled(buttonClicked)
            }
        }
        NavigationLink(destination: Questions(mode: $mode, numberOfQuestions: $numberOfQuestions, selectedMultiplication: $selectedMultiplication)) {
            Text("Begain")
                .font(.largeTitle)
                .frame(width: 350, height: 100)
                .background(buttonClicked ? Color.blue : Color.gray.opacity(0.8))
                .foregroundColor(buttonClicked ? Color.white : Color.gray.opacity(0.8))
                .cornerRadius(40)
        }
        .disabled(!buttonClicked)
    }
}



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
    @Binding var mode: Mode
    @State var numberOfQuestions: Int = 5
    @State var selectedMultiplication: Int = 2
    
    var body: some View {
        HStack {
            Button("Easy") {
                mode = .easy
            }
            
            Button("Medium") {
                mode = .medium
            }
            
            Button("Hard") {
                mode = .hard
            }
        }
        NavigationLink("Start") {
            Questions(mode: $mode, numberOfQuestions: $numberOfQuestions,
                      selectedMultiplication: $selectedMultiplication)
        }
    }
}



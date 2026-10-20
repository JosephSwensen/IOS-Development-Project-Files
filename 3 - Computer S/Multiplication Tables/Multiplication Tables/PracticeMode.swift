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
    }
    
}

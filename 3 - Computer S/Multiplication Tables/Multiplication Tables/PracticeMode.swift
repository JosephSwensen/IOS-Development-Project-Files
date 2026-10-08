//
//  PracticeMode.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct PracticeMode: View {
    @State var mode: modes
    
    enum modes {
        case easy
        case medium
        case hard
    }
    
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

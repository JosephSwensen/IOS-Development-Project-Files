//
//  ContentView.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfQuestions: Int = 5
    @State var selectedMultiplication: Int = 2
    @State var mode: Mode = .easy
    
    var body: some View {
        NavigationStack {
            NavigationLink("test") {
                SelectMultiplecation(selectedMultiplication: $selectedMultiplication)
                
                NavigationStack {
                    NavigationLink("next") {
                        NumberOfQuestions(numberOfQuestions: $numberOfQuestions)
                        NavigationStack {
                            NavigationLink("mode") {
                                PracticeMode(mode: $mode)
                                
                                
                                
                                NavigationStack {
                                    NavigationLink("Start") {
                                        Questions(mode: $mode, numberOfQuestions: $numberOfQuestions,
                                                  selectedMultiplication: $selectedMultiplication
                                        )
                                    }
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            
            
        }
    }
}

#Preview {
    ContentView()
}

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
    
    var body: some View {
        NavigationStack {
            NavigationLink("test") {
                SelectMultiplecation(selectedMultiplication: $selectedMultiplication)
                
                NavigationStack {
                    NavigationLink("next") {
                        NumberOfQuestions(numberOfQuestions: $numberOfQuestions)
                        
                        NavigationStack {
                            NavigationLink("Start") {
                                Questions(
                                    numberOfQuestions: $numberOfQuestions,
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

#Preview {
    ContentView()
}

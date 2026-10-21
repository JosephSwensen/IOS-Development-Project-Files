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
        VStack {
            NavigationStack {
                NavigationLink("test") {
                    SelectMultiplecation(selectedMultiplication: $selectedMultiplication)
                    
                    NavigationStack {
                        NavigationLink("next") {
                            NumberOfQuestions(numberOfQuestions: $numberOfQuestions)
                            NavigationStack {
                                NavigationLink(destination: PracticeMode(mode: $mode)) {
                                    Text("Next Question")
                                        .font(.largeTitle)
                                        .frame(width: 350, height: 100)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(40)
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

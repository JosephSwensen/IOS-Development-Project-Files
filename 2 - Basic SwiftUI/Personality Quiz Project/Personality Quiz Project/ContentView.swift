//
//  ContentView.swift
//  Personality Quiz Project
//
//  Created by Joseph Swensen on 9/30/26.
//

import SwiftUI

struct TitleView: View {
    @State var sheetIsShowing: Bool = false
    @State var selectedAnswers: [Answer] = []
    var body: some View {
        
        NavigationStack {
            VStack {
                Spacer()
                Text("Which Condiment Is Your Soulmate?")
                    .font(.largeTitle)
                Spacer()
                Image("Image")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding()
                NavigationLink("Begin") {
                    QuestionFlowView(questionIndex: 0, selectedAnswers: $selectedAnswers)
                }
                Spacer()
                Spacer()
                Spacer()
                
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("info") {
                                sheetIsShowing = true
                            }
                        }
                    }
                    .sheet(isPresented: $sheetIsShowing) {
                        
                        NavigationStack {
                            VStack {
                                Text("Welcome")
                                    .padding(15)
                                    .font(.largeTitle)
                                
                                Text("Tap the Begin button to start and answer the following questions to see what condiment is your soulmate.")
                                    .padding(50)
                                    .font(.title)

                                Text("If you make a mistake click the \(Image(systemName: "arrow.clockwise")) button to redo your answer.")
                                    .padding(50)
                                    .font(.title)
                            }
                                .toolbar {
                                    ToolbarItem(placement: .topBarTrailing) {
                                        Button("Done") {
                                            sheetIsShowing = false
                                        }
                                        .buttonStyle(.glassProminent)
                                        
                                    }
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    TitleView()
}

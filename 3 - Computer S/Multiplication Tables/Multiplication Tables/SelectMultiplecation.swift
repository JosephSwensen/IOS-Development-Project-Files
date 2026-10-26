//
//  SelectMultiplecation.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct SelectMultiplecation: View {
    @Binding var selectedMultiplication: Int
    @State var mode: Mode = .easy
    @State var numberOfQuestions: Int = 5
    
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.2, blue: 0.0)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 400, height: 150)
                        .cornerRadius(10)
                        .foregroundStyle(.black)
                    
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(.green)
                    Text("select which multiplication you would like to practice")
                        .font(.title)
                        .padding(30)
                }
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 100)
                        .cornerRadius(10)
                        .foregroundStyle(.black)
                    
                    Rectangle()
                        .frame(width: 100, height: 50)
                        .cornerRadius(10)
                        .foregroundStyle(.green)
                    Text("\(selectedMultiplication)")
                        .font(.largeTitle)
                }
                Spacer()
                HStack {
                    Button(action: {
                        guard selectedMultiplication < 12 else { return }
                        selectedMultiplication += 1
                    }) {
                        Text("+")
                            .font(.largeTitle)
                            .frame(width: 170, height: 100)
                            .background(selectedMultiplication >= 12 ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .disabled(selectedMultiplication >= 12)
                    
                    Button(action: {
                        guard selectedMultiplication > 2 else { return }
                        selectedMultiplication -= 1
                    }) {
                        Text("-")
                            .font(.largeTitle)
                            .frame(width: 170, height: 100)
                            .background(selectedMultiplication <= 2 ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .disabled(selectedMultiplication <= 2)
                }
                
                NavigationLink(destination: NumberOfQuestions(numberOfQuestions: $numberOfQuestions, mode: $mode, selectedMultiplication: $selectedMultiplication)) {
                    Text("Next")
                        .font(.largeTitle)
                        .frame(width: 350, height: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                }
                .padding()
            }
        }
    }
}

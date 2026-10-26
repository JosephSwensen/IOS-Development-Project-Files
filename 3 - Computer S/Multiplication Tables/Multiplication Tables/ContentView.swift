//
//  ContentView.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct ContentView: View {
    @State var selectedMultiplication: Int = 2
    
    var body: some View {
        NavigationStack {
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
                        
                        Text("Multiplication\n  Practice")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: SelectMultiplecation(selectedMultiplication: $selectedMultiplication)) {
                        Text("Start")
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
}
#Preview {
    ContentView()
}

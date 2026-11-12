//
//  ContentView.swift
//  Alerts and Dialogs Lab
//
//  Created by Joseph Swensen on 11/11/26.
//

import SwiftUI

enum ErrorAlert: LocalizedError {
    case notEnoughCharacters
    case toLong

    
    
    var errorDescription: String {
        switch self {
        case .notEnoughCharacters:
            return "You need to add more characters"
        case .toLong:
            return "You need to make it shorter"
        }
    }
}

struct ContentView: View {
    @State var button1Show: Bool = false
    @State var button1Number: Int = 5
    
    @State var button2Show: Bool = false
    @State var button2Text: String = ""
    
    @State var button3Text: String = ""
    @State var button3Show: Bool = false
    @State var button3Error: ErrorAlert = .notEnoughCharacters
    
    @State var numberArray: [Int] = [1, 2, 3]
    @State var button4Show: Bool = false
    @State var tappedNumber: Int?
    
    @State var button5Show: Bool = false
    @State var button6Show: Bool = false
    @State var button6Number: Int = 0
    
    func check() throws {
        if button3Text.count > 10 {
            button3Error = .toLong
            throw ErrorAlert.toLong
        } else if button3Text.count < 3 {
            button3Error = .notEnoughCharacters
            throw ErrorAlert.notEnoughCharacters
        }
    }
    
    var body: some View {
        VStack {
            Text("\(button1Number)")
            Button("reset to 0") {
                button1Show = true
            }
            .alert("Rest number to 0", isPresented: $button1Show) {
                Button("reset", role: .destructive) {
                    button1Show = false
                    button1Number = 0
                }
            } message: {
                Text("can not be undone")
            }
        }
        .padding()
        .border(.red)
        
        VStack {
            Text("\(button2Text)")
            Button("Change Text") {
                button2Show = true
            }
            .alert("Change Text", isPresented: $button2Show) {
                var og = button2Text
                TextField("", text: $button2Text)
                
                Button("Save") {
                    
                }
                
                Button("Cancel", role: .cancel) {
                    button2Text = og
                }
            } message: {
                Text("can not be undone")
            }
        }
        .padding()
        .border(.red)
        
        VStack {
            TextField("", text: $button3Text)
            Button("Save") {
                do {
                    try check()
                } catch {
                    button3Show = true
                }
            }
            .alert("Error: \(button3Error)", isPresented: $button3Show) {
                
            } message: {
                Text(button3Error.errorDescription)
            }
        }
        .padding()
        .border(.red)
        
        VStack {
            ForEach(numberArray, id: \.self) { num in
                Button("\(num)") {
                    tappedNumber = num
                    button4Show = true
                }
                .alert("you clicked: \(tappedNumber ?? 0)", isPresented: $button4Show) {
                    
                }
            }
        }
        .padding()
        .border(.red)
        
        VStack {
            Button("confirmationDialog") {
                button5Show = true
            }
            .confirmationDialog("Hello", isPresented: $button5Show, titleVisibility: .visible) {
                
                Button("Delete", role: .destructive) {
                    
                }
                
                Button("Cancel", role: .cancel) {
                    
                }
                
            } message: {
                Text("My name is Joey")
            }
        }
        .padding()
        .border(.red)
        
        VStack {
            Text("\(button6Number)")
            Button("number") {
                button6Show = true
            }
            .confirmationDialog("Hello", isPresented: $button6Show, titleVisibility: .visible) {
                
                Button("1") {
                    button6Number = 1
                }
                
                Button("5") {
                    button6Number = 5
                }
                
                Button("7") {
                    button6Number = 7
                }
                
            } message: {
                Text("Pick a number")
            }
        }
        .padding()
        .border(.red)
    }
}

#Preview {
    ContentView()
}

//
//  SelectMultiplecation.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct SelectMultiplecation: View {
    @Binding var selectedMultiplication: Int
    @State var buttonDisabledAdd: Bool = false
    @State var buttonDisabledMinus: Bool = false
    
    var body: some View {
           
        VStack {
            Text("\(selectedMultiplication)")
            HStack {
                
                Button("+") {
                    selectedMultiplication += 1
                    
                    buttonDisabledMinus = false
                    
                    if selectedMultiplication == 12 {
                        buttonDisabledAdd = true
                    }
                }
                .disabled(buttonDisabledAdd)
                
                Button("-") {
                    selectedMultiplication -= 1
                    
                    buttonDisabledAdd = false
                    
                    if selectedMultiplication == 2 {
                        buttonDisabledMinus = true
                    }
                }
                .disabled(buttonDisabledMinus)
            }
        }
    }
}

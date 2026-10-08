//
//  SelectMultiplecation.swift
//  Multiplication Tables
//
//  Created by Joseph Swensen on 10/6/26.
//

import SwiftUI

struct SelectMultiplecation: View {
    @State var selectedMultiplication: Int = 2
    
    var body: some View {
        Stepper("select which multiplication tables to practice ", value: $selectedMultiplication, in: 2...12)
    }
}

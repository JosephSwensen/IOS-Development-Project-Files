//
//  ContentView.swift
//  Theming Lab
//
//  Created by Joseph Swensen on 11/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 100)
                .foregroundStyle(Theme.cardBackground)
                .padding(Theme.spacing)
            
            VStack {
                Text("Title")
                    .font(Theme.titleFont)
                    .foregroundStyle(.primary)
                
                Text("Subtitle")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

#Preview("Light") {
    ContentView()
}

#Preview("Dark") {
    ContentView()
        .environment(\.colorScheme, .dark)
}

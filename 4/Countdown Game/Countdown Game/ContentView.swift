//
//  ContentView.swift
//  Countdown Game
//
//  Created by Joseph Swensen on 11/13/26.
//

import SwiftUI

struct ContentView: View {
    @State var gameStarted: Bool = false
    @State var isMuted: Bool = false
    
    var body: some View {
        Text("Countdown")
        
        Spacer()
        
        Image(systemName: "gamecontroller.fill")
            .scaleEffect(gameStarted ? 50 : 10)
            .opacity(gameStarted ? 0.5 : 1)
            .foregroundStyle(gameStarted ? .yellow : .blue)
            .frame(height: gameStarted ? 50 : 30)
        
        Spacer()
        
        Image(systemName: "speaker.wave.2.fill")
            .opacity(isMuted ? 0.3 : 0.8)
            .animation(.easeInOut, value: isMuted)
        
        Button("Sound") {
            isMuted.toggle()
        }
        
        Spacer()
        
        Button("Start Game") {
            withAnimation() {
                gameStarted = true
            }
        }
        
        Button("Back") {
            gameStarted = false
        }
        
    }
}

#Preview {
    ContentView()
}

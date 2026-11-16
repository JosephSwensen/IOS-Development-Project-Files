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
    @State var countdown: String = ""
    @State var isPulsing = false
    
    var body: some View {
        Text("Countdown")
        
        Spacer()
        
        ZStack {
            switch countdown {
            case "3":
                Text("3")
                    .transition(.asymmetric(
                        insertion: .scale(scale: 3).combined(with: .opacity),
                        removal: .opacity
                    ))
            case "2":
                Text("2")
                    .transition(.asymmetric(
                        insertion: .scale(scale: 3).combined(with: .opacity),
                        removal: .opacity
                    ))
            case "1":
                Text("1")
                    .transition(.asymmetric(
                        insertion: .scale(scale: 3).combined(with: .opacity),
                        removal: .opacity
                    ))
            case "GO!":
                Text("GO!")
                    .transition(.asymmetric(
                        insertion: .scale(scale: 3).combined(with: .opacity),
                        removal: .opacity
                    ))
            default:
                Text("")
            }
        }

        Spacer()
        
        Image(systemName: "gamecontroller.fill")
            .scaleEffect(gameStarted ? 50 : 10)
            .opacity(gameStarted ? 0.1 : 1)
            .foregroundStyle(gameStarted ? .yellow : .blue)
            .frame(height: gameStarted ? 50 : 30)
        
        Spacer()
        
        Image(systemName: "speaker.wave.2.fill")
            .opacity(isMuted ? 0.3 : 0.8)
            .animation(.easeInOut(duration: 0.3), value: isMuted)
        
        Button("Sound") {
            isMuted.toggle()
        }
        
        Spacer()
        
        if gameStarted {
            Button("Back") {
                gameStarted = false
                countdown = ""
                isPulsing = false
            }
        } else {
            Button("Start Game") {
                withAnimation(.easeInOut(duration: 0.5)) {
                    gameStarted = true
                }

                withAnimation(.easeOut(duration: 0.4).delay(1)) {
                    countdown = "3"
                }
                withAnimation(.easeOut(duration: 0.4).delay(2)) {
                    countdown = "2"
                }
                withAnimation(.easeOut(duration: 0.4).delay(3)) {
                    countdown = "1"
                }
                withAnimation(.spring(response: 0.5, dampingFraction: 0.6).delay(4)) {
                    countdown = "GO!"
                }
            }
            .scaleEffect(isPulsing ? 1.06 : 1)
            .onAppear {
                withAnimation(.easeInOut(duration: 0.9).repeatForever(autoreverses: true)) {
                    isPulsing = true
                }
            }
        }

    }
}

#Preview {
    ContentView()
}

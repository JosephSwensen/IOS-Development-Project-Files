import SwiftUI

struct ContentView: View {
    
    @State var message = "Press a button!"
    @State var backgroundColor: Color = .black
    @State var counter = 0
    @State var showStar = false
    
    var body: some View {
        
        ZStack {
            backgroundColor
            VStack(spacing: 15) {
                
                Text(message)
                    .font(.title2)
                    .foregroundStyle(.white)
                
                Text("Counter: \(counter)")
                    .foregroundStyle(.white)
                
                // BUTTON 1
                Button("Say Hello") {
                    message = "Hello Joey!"
                }
                .buttonStyle(.borderedProminent)
                
                
                // BUTTON 2
                Button("Change Background") {
                    backgroundColor = .purple
                }
                .tint(.purple)
                
                
                // BUTTON 3
                Button {
                    showStar.toggle()
                } label: {
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.yellow)
                }
                
                if showStar {
                    Image(systemName: "star.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.yellow)
                }
                
                
                // BUTTON 4
                Button("Add 1") {
                    counter += 1
                }
                .buttonStyle(.bordered)
                
                
                // BUTTON 5
                Button("Reset Everything") {
                    counter = 0
                    message = "Press a button!"
                    backgroundColor = .black
                    showStar = false
                }
                
                
                // BUTTON 6
                Button("GIANT BUTTON") {
                    message = "BIG BUTTON"
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                
                // BUTTON 7
                Button("Capsule Button") {
                    message = "Capsule pressed!"
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                
                
                // BUTTON 8
                Button("Tiny") {
                    message = "Tiny button"
                }
                .font(.caption2)
                
                
                // BUTTON 9
                Button {
                    message = "Rocket launched"
                } label: {
                    HStack {
                        Image(systemName: "airplane")
                        Text("Launch")
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                
                
                // BUTTON 10 - SOMETIMES DISABLED
                Button("Secret Button") {
                    message = "You unlocked the secret button"
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .disabled(counter < 3)
                
                
                Text("Press Add 1 three times to unlock the secret button.")
                    .font(.caption)
                    .foregroundStyle(.white)
            }
        }
    }
}


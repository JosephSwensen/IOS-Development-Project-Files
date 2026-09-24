//
//  PetsScreen.swift
//  Pet Sitter (Images Lab)
//

import SwiftUI

struct PetsScreen: View {
    var body: some View {
        // The page already scrolls. You don't need to change
        // the ScrollView or the VStack.
        ScrollView {
            VStack(spacing: 24) {
                // Step 1: replace this with the header.
                ZStack {
                    Image("pet1")
                        .resizable()
                        .frame(width: 350, height: 220)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                
                    Text("This Week's Pets")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                }
                // Step 2: replace this with the row of pets.
                HStack {
                    Image("pet2")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .overlay(
                                Circle()
                                    .stroke(lineWidth: 3)
                            )
                }

                // Step 3: replace this with the care icons.
                HStack {
                    Image(systemName: "fork.knife")
                        .font(.title)
                        .foregroundStyle(.gray)
                    Text("Fed twice a day")
                    
                    Image(systemName: "figure.walk")
                        .font(.title)
                        .foregroundStyle(.mint)
                    Text("Two walks")
                    
                    Image(systemName: "drop.fill")
                        .font(.title)
                        .foregroundStyle(.blue)
                    Text("Fresh water")
                }

                // Step 4: replace this with the full photo.
                Image("pet2")
                    .resizable()
                    .frame(width: 350, height: 300)
            }
            .padding()
        }
    }
}

#Preview {
    PetsScreen()
}

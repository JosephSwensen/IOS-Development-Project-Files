//
//  VolunteerCard.swift
//  Food Drive
//
//  Created by Joseph Swensen on 11/5/26.
//
import SwiftUI

struct VolunteerCard: View {
    let name: String
    let description: String
    let systemImage: String
    
    var body: some View {
        VStack {
            Image(systemName: systemImage)
            Text(name)
                .font(.headline)
            Text(description)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.green.opacity(0.15))
        .clipShape(.rect(cornerRadius: 12))
    }
}


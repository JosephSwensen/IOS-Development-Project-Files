//
//  VolunteerCard.swift
//  Food Drive
//
//  Created by Joseph Swensen on 11/5/26.
//
import SwiftUI

struct VolunteerCard: View {
    let name: Volunteer
    let description: Volunteer
    let systemImage: Volunteer
    
    var body: some View {
        VStack {
            Image(systemName: systemImage.systemImage)
            Text(name.name)
                .font(.headline)
            Text(description.description)
                .font(.caption)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.green.opacity(0.15))
        .clipShape(.rect(cornerRadius: 12))
    }
}


//
//  GymCard.swift
//  Summit Climbing
//
//  Created by Joseph Swensen on 11/7/26.
//

import SwiftUI

struct GymCard<Content: View>: View {
    let title: String
    let systemImage: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(title, systemImage: systemImage)
                .font(.headline)
                .foregroundStyle(.orange)

            content()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.orange.opacity(0.12))
        .clipShape(.rect(cornerRadius: 12))
    }
}

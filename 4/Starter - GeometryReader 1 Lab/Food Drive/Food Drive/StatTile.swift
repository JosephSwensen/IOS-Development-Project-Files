//
//  StatTile.swift
//  Food Drive
//

import SwiftUI

struct StatTile: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title)
                .bold()

            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.green.opacity(0.15))
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    StatTile(title: "Days Left", value: "6")
}

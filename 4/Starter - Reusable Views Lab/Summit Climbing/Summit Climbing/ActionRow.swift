//
//  ActionRow.swift.swift
//  Summit Climbing
//
//  Created by Joseph Swensen on 11/4/26.
//

import SwiftUI

struct ActionRow: View {
    let title: String
    var systemImage: String = "arrow.right.circle"
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                    .foregroundStyle(.orange)
                    .frame(width: 28)

                Text(title)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 6)
            .contentShape(.rect)
        }
        .buttonStyle(.plain)
    }
}

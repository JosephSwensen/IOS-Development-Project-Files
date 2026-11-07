//
//  ActionRow.swift.swift
//  Summit Climbing
//
//  Created by Joseph Swensen on 11/4/26.
//

import SwiftUI

struct ActionRow: View {
    var title: String
    var systemImage: String = "arrow.right.circle"
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Image(systemName: systemImage)
                    .foregroundStyle(.orange)
                    .frame(width: 28)
                Text(title)
            }
        }
    }
}

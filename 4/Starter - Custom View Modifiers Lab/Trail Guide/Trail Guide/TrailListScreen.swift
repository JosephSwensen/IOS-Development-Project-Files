//
//  TrailListScreen.swift
//  Trail Guide
//
//  This app works, but the same chains of modifiers are copied
//  all over it. Read the lab for tonight's steps.
//

import SwiftUI

struct TrailListScreen: View {
    let trails = Trail.sampleTrails

    var body: some View {
        NavigationStack {
            List(trails) { trail in
                NavigationLink {
                    TrailDetailScreen(trail: trail)
                } label: {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(trail.name)
                            .font(.headline)

                        Text("\(trail.miles.formatted()) mi · \(trail.elevationGain) ft gain")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)

                        HStack {
                            Text(trail.difficulty.rawValue)
                                .pillStyle(color: trail.difficulty.color)

                            if !trail.isOpen {
                                Text("Closed")
                                    .pillStyle(color: .gray)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Utah County Trails")
        }
    }
}

#Preview {
    TrailListScreen()
}

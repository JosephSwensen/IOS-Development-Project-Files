//
//  TrailDetailScreen.swift
//  Trail Guide
//

import SwiftUI

struct TrailDetailScreen: View {
    let trail: Trail

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(trail.difficulty.rawValue)
                    .pillStyle(color: trail.difficulty.color)

                Text(trail.isOpen ? "Open" : "Closed")
                    .pillStyle(color: trail.isOpen ? Color.blue : Color.gray)
                    
            }

            Text(trail.location)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            Text("Trail Stats")
                .sectionHeaderStyle()

            HStack {
                VStack {
                    Text(trail.miles.formatted())
                        .font(.title2)
                        .bold()
                    Text("Miles")
                        .statLabelStyle()
                }
                .frame(maxWidth: .infinity)

                VStack {
                    Text("\(trail.elevationGain)")
                        .font(.title2)
                        .bold()
                    Text("Feet Up")
                        .statLabelStyle()
                }
                .frame(maxWidth: .infinity)

                VStack {
                    Text(trail.hours)
                        .font(.title2)
                        .bold()
                    Text("Hours")
                        .statLabelStyle()
                }
                .frame(maxWidth: .infinity)
            }
            .panelStyle()

            Text("About This Trail")
                .sectionHeaderStyle()

            Text(trail.about)
                .panelStyle()

            Text("What to Bring")
                .sectionHeaderStyle()

            VStack(alignment: .leading, spacing: 6) {
                ForEach(trail.gear, id: \.self) { item in
                    Text("• \(item)")
                }
            }
            .panelStyle(tint: .orange)

            Spacer()
        }
        .padding()
        .navigationTitle(trail.name)
    }
}

#Preview {
    NavigationStack {
        TrailDetailScreen(trail: Trail.sampleTrails[1])
    }
}

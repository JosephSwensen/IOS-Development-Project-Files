//
//  Trail.swift
//  Trail Guide
//
//  The model and sample data. You don't need to change this file.
//

import SwiftUI

enum Difficulty: String {
    case easy = "Easy"
    case moderate = "Moderate"
    case hard = "Hard"

    var color: Color {
        switch self {
        case .easy:
            return .green
        case .moderate:
            return .orange
        case .hard:
            return .red
        }
    }
}

struct Trail: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var miles: Double
    var elevationGain: Int
    var hours: String
    var difficulty: Difficulty
    var isOpen: Bool
    var about: String
    var gear: [String]
}

extension Trail {
    static let sampleTrails: [Trail] = [
        Trail(
            name: "Bridal Veil Falls",
            location: "Provo Canyon",
            miles: 1.2,
            elevationGain: 150,
            hours: "1",
            difficulty: .easy,
            isOpen: true,
            about: "A short, paved walk to a tall waterfall. Good for a first hike or a quick evening outing.",
            gear: ["Water", "Light jacket", "Phone for photos"]
        ),
        Trail(
            name: "Stewart Falls",
            location: "Sundance",
            miles: 3.4,
            elevationGain: 680,
            hours: "2",
            difficulty: .moderate,
            isOpen: true,
            about: "A shaded trail through aspen trees that ends at a two-tier waterfall. The last section is steep and rocky.",
            gear: ["Water", "Trail shoes", "Snack", "Sunscreen"]
        ),
        Trail(
            name: "Y Mountain",
            location: "Provo",
            miles: 2.4,
            elevationGain: 1000,
            hours: "2",
            difficulty: .moderate,
            isOpen: true,
            about: "Twelve switchbacks up to the block Y above Provo. There is very little shade, so start early.",
            gear: ["Water", "Hat", "Sunscreen"]
        ),
        Trail(
            name: "Mount Timpanogos",
            location: "American Fork Canyon",
            miles: 14.6,
            elevationGain: 4500,
            hours: "9",
            difficulty: .hard,
            isOpen: false,
            about: "A full-day climb to the second highest peak in the Wasatch. The trail closes when snow covers the upper switchbacks.",
            gear: ["3 liters of water", "Lunch", "Warm layers", "Headlamp", "First aid kit"]
        )
    ]
}

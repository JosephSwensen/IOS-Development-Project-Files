import Foundation
import Observation

@Observable
class AddPlayerViewModel {
    var name = ""
    var selectedIcon = "person.fill"

    let icons = [
        "person.fill", "star.fill", "bolt.fill", "flame.fill",
        "heart.fill", "leaf.fill", "moon.fill", "sun.max.fill",
        "gamecontroller.fill", "trophy.fill", "shield.fill", "pawprint.fill"
    ]

    var canAddPlayer: Bool {
        !name.isEmpty
    }

    func makePlayer() -> Player? {
        guard canAddPlayer else { return nil }
        return Player(
            name: name,
            icon: selectedIcon
        )
    }
}

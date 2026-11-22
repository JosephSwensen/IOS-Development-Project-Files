import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score = 0
}

struct Game: Identifiable {
    let id = UUID()
    var title: String
    var players: [Player]
}

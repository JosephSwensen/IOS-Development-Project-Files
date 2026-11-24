import Foundation

struct Player: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var score = 0
    var icon = "person.fill"
}

struct Game: Identifiable {
    let id = UUID()
    var title: String
    var players: [Player]
    var sortOption = "Highest total"
    var sortWhoWinsOption = "Highest total"
}

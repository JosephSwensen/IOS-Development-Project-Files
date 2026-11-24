import Observation

@Observable
class GamesViewModel {
    var games: [Game] = [
        Game(title: "Solos", players: ["Joey", "Brynn"].map { Player(name: $0) }),
        Game(title: "Duos", players: ["Kaylie", "Brylee"].map { Player(name: $0) }),
        Game(title: "Trios", players: ["Ashlyn", "Jeremy"].map { Player(name: $0) }),
        Game(title: "Squads", players: ["Whitney", "James"].map { Player(name: $0) })
    ]

    var sheetIsShowing = false
    var newGameTitle = ""
    let sortBy = ["Highest total", "Lowest total"]
    var sortOption = "Highest total"
    let sortWhoWins = ["Highest total", "Lowest total"]
    var sortWhoWinsOption = "Highest total"
    var showAddPlayerSheet = false
    var playerList: [Player] = []
    var isSaveAlert = false

    func addPlayer(_ player: Player) {
        playerList.append(player)
    }

    func saveGame() {
        guard !newGameTitle.isEmpty else {
            isSaveAlert = true
            return
        }

        games.append(Game(
            title: newGameTitle,
            players: playerList,
            sortOption: sortOption,
            sortWhoWinsOption: sortWhoWinsOption
        ))
        sheetIsShowing = false
        playerList = []
        newGameTitle = ""
        sortOption = "Highest total"
        sortWhoWinsOption = "Highest total"
    }
}

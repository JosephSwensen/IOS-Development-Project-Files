import Playgrounds
import SwiftUI

struct Game: Identifiable {
    var id = UUID()

    var title: String
    var genra: String
    var installed: Bool
}

let zelda = Game(title: "Zelda", genra: "Adventure", installed: true)
let mario = Game(title: "Mario Kart", genra: "Racing", installed: true)
let minecraft = Game(title: "Minecraft", genra: "Sandbox", installed: true)
let fortnite = Game(title: "Fortnite", genra: "Battle Royale", installed: false)
let pokemon = Game(title: "Pokemon", genra: "RPG", installed: true)
let halo = Game(title: "Halo", genra: "Shooter", installed: false)
let animalCrossing = Game(
    title: "Animal Crossing",
    genra: "Simulation",
    installed: true
)
let stardewValley = Game(
    title: "Stardew Valley",
    genra: "Farming",
    installed: false
)

struct ContentView: View {

    @State var games = [
        zelda, mario, minecraft, fortnite, pokemon, halo, animalCrossing,
        stardewValley,
    ]
    @State var filterSelection = "All"

    let filterOptions = ["All", "Installed", "Uninstalled"]

    var filteredGames: [Game] {
        switch filterSelection {
        case "Installed":
            return games.filter { $0.installed }
        case "Uninstalled":
            return games.filter { !$0.installed }
        default:
            return games
        }
    }
    var body: some View {

        Picker("Filter", selection: $filterSelection) {
            ForEach(filterOptions, id: \.self) { option in
                Text(option)
            }
        }
            .pickerStyle(.segmented)
        
        List {
            ForEach(filteredGames) { game in
                Text("\(game.title) - \(game.genra) - \(game.installed ? "Installed" : "Uninstalled")")            }
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}

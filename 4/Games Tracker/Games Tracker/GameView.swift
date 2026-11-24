import SwiftUI

struct GameView: View {
    @Binding var game: Game

    func sortPlayers() {
        game.players.sort { first, second in
            if game.sortOption == "Lowest total" {
                return first.score < second.score
            }
            return first.score > second.score
        }
    }

    var body: some View {
        List {
            ForEach($game.players) { $player in
                HStack {
                    Text(player.name)
                    Spacer()
                    Stepper("", value: $player.score)
                    Text("\(player.score)")
                        .padding()
                }
            }
        }
        .navigationTitle(game.title)
        }
    }

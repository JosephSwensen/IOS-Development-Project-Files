import SwiftUI

struct GameView: View {
    @Binding var game: Game
    @State var showAddPlayerSheet = false

    func sortPlayers() {
        game.players.sort { first, second in
            if game.sortOption == "Lowest total" {
                return first.score < second.score
            }
            return first.score > second.score
        }
    }

    var body: some View {
        VStack {
            List {
                ForEach($game.players) { $player in
                    HStack {
                        Label(player.name, systemImage: player.icon)
                        Spacer()
                        Stepper("", value: $player.score)
                        Text("\(player.score)")
                            .padding()
                    }
                }
                .onDelete { offsets in
                    game.players.remove(atOffsets: offsets)
                }
            }

            Button("Add Player", systemImage: "person.badge.plus") {
                showAddPlayerSheet = true
            }
            .buttonStyle(.tracker)
            .padding()
        }
        .navigationTitle(game.title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
        .sheet(isPresented: $showAddPlayerSheet) {
            AddPlayerView { player in
                game.players.append(player)
            }
        }
        .onChange(of: game.players) {
            sortPlayers()
        }
        .onChange(of: game.sortOption) {
            sortPlayers()
        }
    }
}

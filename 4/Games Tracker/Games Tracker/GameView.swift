import SwiftUI

struct GameView: View {
    @Binding var game: Game

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

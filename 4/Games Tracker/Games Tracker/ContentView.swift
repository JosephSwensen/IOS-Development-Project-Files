//
//  ContentView.swift
//  Games Tracker
//
//  Created by Joseph Swensen on 11/19/26.
//

import SwiftUI

struct ContentView: View {
    @State var gameInfo = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($gameInfo.games) { $game in
                    NavigationLink(destination: GameView(game: $game)) {
                        HStack {
                            Text(game.title)
                            Spacer()
                            let winner = game.sortWhoWinsOption == "Lowest total"
                                ? game.players.min(by: { $0.score < $1.score })
                                : game.players.max(by: { $0.score < $1.score })

                            if let winner {
                                Text("Current Winner: \(winner.name)")
                            } else {
                                Text("Add players")
                            }
                        }
                    }
                }
                .onDelete { offsets in
                    gameInfo.games.remove(atOffsets: offsets)
                }
                .onMove { offsets, destination in
                    gameInfo.games.move(fromOffsets: offsets, toOffset: destination)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("+") {
                        gameInfo.sheetIsShowing = true
                    }
                    .font(.title)
                }
            }
            .sheet(isPresented: $gameInfo.sheetIsShowing) {
                NavigationStack {
                    VStack {
                        HStack {
                            Text("Enter a game name:")
                            TextField("Add game name", text: $gameInfo.newGameTitle)
                                .frame(width: 200)
                        }
                            
                        HStack {
                            Text("Sort players by:")

                            Picker("Sort players by:", selection: $gameInfo.sortOption) {
                                ForEach(gameInfo.sortBy, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .frame(width: 150)
                            .pickerStyle(.segmented)
                            .padding()
                        }
                        
                        HStack {
                            Text("Who Wins:")

                            Picker("Who Wins:", selection: $gameInfo.sortWhoWinsOption) {
                                ForEach(gameInfo.sortWhoWins, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .frame(width: 150)
                            .pickerStyle(.segmented)
                        }
                        
                        List {
                            ForEach(gameInfo.playerList) { player in
                                Label(player.name, systemImage: player.icon)
                            }
                        }
                        
                        Button("Add Players") {
                            gameInfo.showAddPlayerSheet = true
                        }
                        .buttonStyle(.tracker)
                        .sheet(isPresented: $gameInfo.showAddPlayerSheet) {
                            AddPlayerView { player in
                                gameInfo.addPlayer(player)
                            }
                        }

                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Save") {
                                    gameInfo.saveGame()
                                }
                                .alert("You have to enter a game name to save", isPresented: $gameInfo.isSaveAlert) {
                                    
                                }
                            }
                        }
                    }
                    .navigationTitle("Add New Game")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

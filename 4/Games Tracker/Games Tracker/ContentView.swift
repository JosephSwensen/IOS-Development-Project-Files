//
//  ContentView.swift
//  Games Tracker
//
//  Created by Joseph Swensen on 11/19/26.
//

import SwiftUI

struct ContentView: View {
    @State private var gameInfo = GamesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($gameInfo.games) { $game in
                    NavigationLink(destination: GameView(game: $game)) {
                        HStack {
                            Text(game.title)
                            Spacer()
                            if let winner = game.players.first?.name {
                                Text("Current Winner: \( game.players.first!.name) ")
                            } else {
                                Text("Add players")
                            }
                            
                        }
                    }
                }
            }
            .toolbar {
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
                            ForEach(gameInfo.playerList, id: \.self) { player in
                                Text(player)
                            }
                        }
                        
                        Button("Add Players") {
                            gameInfo.showAddPlayerAlert = true
                        }
                        .buttonStyle(.glassProminent)
                        .alert("Add Player", isPresented: $gameInfo.showAddPlayerAlert) {
                            TextField("Type Your Name", text: $gameInfo.textBox)
                            
                            Button("Save") {
                                gameInfo.addPlayer()
                            }
                            Button("Cancel", role: .cancel) {
                                gameInfo.cancelAddingPlayer()
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

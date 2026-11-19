//
//  ContentView.swift
//  Games Tracker
//
//  Created by Joseph Swensen on 11/19/26.
//

import SwiftUI

@Observable
class viewModel: Identifiable {
    
    var games: [String] = ["Solos", "Duos", "Trios", "Squads"]

    var solos: [String] = []

    var duos: [String] = []
    
    var trios: [String] = []
    
    var squads: [String] = []
    
    var winners: [String] = [""]
    
    var sheetIsShowing: Bool = false
    var newGameTitle: String = ""
    var sortBy:[String] = ["Wins", "Kills"]
    var sortOption: String = "Wins"
    
    var sortWhoWins:[String] = ["s", "g"]
    var sortWhoWinsOption: String = "s"
    
    var showAddPlayerAlert: Bool = false
    var textBox: String = ""
    var playerList: [String] = []
    
    var isSaveAlert: Bool = false
    
    
}

struct ContentView: View {
    @State var gameInfo: viewModel = viewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(gameInfo.games, id: \.self) {
                    game in
                    HStack {
                        Text(game)
                        Spacer()
                        Text("Current Winner: ")
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
                                gameInfo.playerList.append(gameInfo.textBox)
                            }
                            Button("Cancel", role: .cancel) {
                                gameInfo.showAddPlayerAlert = false
                                gameInfo.textBox = ""
                            }
                        }
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Save") {
                                    if gameInfo.newGameTitle == "" {
                                        gameInfo.isSaveAlert = true
                                    } else {
                                        gameInfo.games.append(gameInfo.newGameTitle)
                                        gameInfo.sheetIsShowing = false
                                        gameInfo.playerList = []
                                        gameInfo.newGameTitle = ""
                                    }
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

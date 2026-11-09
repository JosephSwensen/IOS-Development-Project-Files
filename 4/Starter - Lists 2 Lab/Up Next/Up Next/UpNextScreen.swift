//
//  UpNextScreen.swift
//  Up Next
//

import SwiftUI

struct UpNextScreen: View {
    @State private var episodes = [
        "The Race to Build the Space Station",
        "How Pizza Took Over the World",
        "Why Octopuses Are So Smart",
        "Living on Mars: Is It Possible?",
        "The Secret Life of Bees",
        "Space Junk and Why It Matters",
        "The Science of Sleep",
        "Who Invented the Video Game?",
        "Mysteries of the Deep Ocean",
        "Packing for a Trip to Space"
    ]
    
    @State var shearchText: String = ""
    
    var filteredEpisodes: [String] {
        
        if shearchText == "" {
            return episodes
        } else {
            return episodes.filter {
                $0.localizedCaseInsensitiveContains(shearchText)
                
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredEpisodes, id: \.self) { episode in
                    Text(episode)
                        .swipeActions(edge: .leading) {
                            Button("Play Next", systemImage: "forward.end.fill") {
                                episodes.removeAll{ $0 == episode }
                                episodes.insert(episode, at: 0)
                            }
                            .tint(.yellow)
                        }
                }
                .onMove { from, to in episodes.move(fromOffsets: from, toOffset: to)
                }
                .onDelete { index in episodes.remove(atOffsets: index)
                    
                }
            }
            .searchable(text: $shearchText)
            .toolbar {
                EditButton()
            }
            .navigationTitle("Up Next")
        }
    }
}

#Preview {
    UpNextScreen()
}

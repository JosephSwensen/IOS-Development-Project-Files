//
//  DragonListScreen.swift
//  DragonDex
//
//  Created by Joseph Swensen on 11/6/26.
//

import SwiftUI

struct DragonListScreen: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(dragons, id: \.name) { dragon in
                    NavigationLink(dragon.name, value: dragon)
                }
            }
            .navigationDestination(for: Dragon.self) { dragon in
                DragonDetailScreen(path: $path, dragon: dragon)
            }
            .toolbar {
                Button("Random Dragon") {
                    if let random = dragons.randomElement() {
                        path.append(random)
                    }
                }
            }
        }
        
    }
}

#Preview {
    DragonListScreen()
}

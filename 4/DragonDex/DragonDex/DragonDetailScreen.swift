//
//  DragonDetailScreen.swift
//  DragonDex
//
//  Created by Joseph Swensen on 11/6/26.
//

import SwiftUI

struct DragonDetailScreen: View {
    @Binding var path: NavigationPath
    let dragon: Dragon
    
    var body: some View {
        Text(dragon.name)
        Text(dragon.species)
        Text("\(dragon.fireRating)")
        Text(dragon.lore)
            List {
                ForEach(dragon.powers, id: \.name) {
                    power in NavigationLink(power.name, value: power)
                }
            }
            .navigationDestination(for: Power.self) { power in
                PowerDetailScreen(path: $path, power: power)
            }
    }
}

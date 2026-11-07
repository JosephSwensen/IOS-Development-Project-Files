//
//  PowerDetailScreen.swift
//  DragonDex
//
//  Created by Joseph Swensen on 11/6/26.
//

import SwiftUI

struct PowerDetailScreen: View {
    @Binding var path: NavigationPath
    let power: Power
    
    var body: some View {
        Text(power.name)
        Text(power.description)
        Button("Back to Dragons") {
            path = NavigationPath()
        }
    }
}

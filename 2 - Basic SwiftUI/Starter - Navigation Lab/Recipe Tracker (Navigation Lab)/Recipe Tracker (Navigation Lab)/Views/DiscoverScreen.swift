//
//  DiscoverView.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import SwiftUI

struct DiscoverScreen: View {
    let discoverRecipes = Recipe.discoverList
    
    var body: some View {
        NavigationStack {
            List(discoverRecipes) { recipe in
                NavigationLink(destination: RecipeDetailScreen(recipe: recipe)) {
                    Text(recipe.title)
                }
                
            }
        }
        .navigationTitle("Discover")
    }
}

#Preview {
    DiscoverScreen()
}

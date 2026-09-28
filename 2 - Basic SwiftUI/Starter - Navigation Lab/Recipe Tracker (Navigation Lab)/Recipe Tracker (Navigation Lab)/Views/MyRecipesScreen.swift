//
//  MyRecipesScreen.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//


import SwiftUI

struct MyRecipesScreen: View {
    @State private var recipes = Recipe.savedList
    @State private var showingAddRecipe = false
    
    var body: some View {
        NavigationStack {
            List(recipes) { recipe in
                NavigationLink(recipe.title) {
                    RecipeDetailScreen(recipe: recipe)
                }
            
                
            }
            .toolbar {
                Button(action: { showingAddRecipe = true}) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct AddRecipeSheet: View {
    @Environment(\.dismiss) var dismiss
    @Binding var recipes: [Recipe]
    
    @State private var title = ""
    @State private var ingredients = ""
    @State private var instructions = ""
    
    var body: some View {
        Form {
            Section("Recipe Info") {
                TextField("Title", text: $title)
                TextField("Ingredients", text: $ingredients, axis: .vertical)
                TextField("Instructions", text: $instructions, axis: .vertical)
            }
        }
        .navigationTitle("New Recipe")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    let newRecipe = Recipe(
                        title: title,
                        ingredients: ingredients,
                        instructions: instructions
                    )
                    recipes.append(newRecipe)
                    dismiss()
                }
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", action: dismiss.callAsFunction)
            }
        }
    }
}

#Preview {
    MyRecipesScreen()
}

//
//  Recipe.swift
//  Recipe Tracker (Navigation Lab)
//
//  Created by Jane Madsen on 10/8/25.
//

import Foundation

struct Recipe: Identifiable {
    let id = UUID()
    var title: String
    var ingredients: String
    var instructions: String
}

extension Recipe {
    static let savedList: [Recipe] = [
        Recipe(title: "Spaghetti Carbonara",
               ingredients: "200g spaghetti, 2 large eggs, 50g pancetta, 100g grated Parmesan cheese, salt and pepper to taste",
               instructions: "Cook the spaghetti in salted boiling water until al dente. In a bowl, whisk the eggs, pancetta, Parmesan cheese, salt and pepper. Pour the egg mixture over the spaghetti and toss to coat. Serve immediately."),
        Recipe(title: "Chocolate Lava Cake",
               ingredients: "200g unsalted butter, 100g caster sugar, 2 large eggs, 1 tsp vanilla extract, 200g dark chocolate, 100g chopped nuts (optional)",
               instructions: "Preheat the oven to 180°C (350°F). Grease and flour two 20cm round cake tins or line with baking parchment. Beat the butter and sugar together until light and fluffy. Add the eggs and vanilla, then stir until combined. Fold in the chocolate and nuts (if using). Divide the batter evenly between the tins. Bake for 20-25 minutes, or until a skewer inserted into the centre comes out clean. Cool in the tins for 10 minutes, then transfer to a wire rack to cool completely."),
        Recipe(title: "Margherita Pizza",
               ingredients: "200g plain flour, 50g olive oil, 1 tsp salt, 100g tomato sauce, 25g mozzarella cheese, fresh basil leaves for garnish",
               instructions: "Preheat the oven to 200°C (400°F). In a large bowl, whisk together the flour, olive oil and salt. Add the tomato sauce and mix until well combined. Transfer the mixture to a greased 24cm round pizza tin. Sprinkle the mozzarella cheese evenly over the top. Bake for 10-15 minutes, or until the cheese is golden brown. Garnish with fresh basil leaves before serving.")
    ]
    
    static let discoverList: [Recipe] = [
        Recipe(title: "Avocado Toast",
               ingredients: "Avocado, bread, salt, pepper, lemon juice",
               instructions: "Toast bread and spread mashed avocado on top."),
        Recipe(title: "Greek Salad",
               ingredients: "Tomatoes, cucumber, feta, olives, olive oil",
               instructions: "Chop ingredients and toss with olive oil.")
    ]
}

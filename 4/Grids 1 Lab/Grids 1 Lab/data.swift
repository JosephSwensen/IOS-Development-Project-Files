//
//  data.swift
//  Grids 1 Lab
//
//  Created by Joseph Swensen on 11/9/26.
//

import SwiftUI

struct Clothing: Hashable, ShapeStyle {
let name: String
let price: Double
let size: String
let color: String
}

// Array of hats
let hats: [Clothing] = [
    Clothing(name: "Baseball Cap", price: 19.99, size: "M", color: "Blue"),
    Clothing(name: "Beanie", price: 14.99, size: "One Size", color: "Black"),
    Clothing(name: "Fedora", price: 29.99, size: "L", color: "Brown"),
    Clothing(name: "Sun Hat", price: 24.99, size: "One Size", color: "White"),
    Clothing(name: "Bucket Hat", price: 22.99, size: "One Size", color: "Yellow"),
    Clothing(name: "Cowboy Hat", price: 34.99, size: "L", color: "Tan"),
    Clothing(name: "Snapback", price: 18.99, size: "Adjustable", color: "Black"),
    Clothing(name: "Visor", price: 16.99, size: "Adjustable", color: "Pink"),
    Clothing(name: "Trucker Hat", price: 20.99, size: "Adjustable", color: "Red"),
    Clothing(name: "Beret", price: 27.99, size: "One Size", color: "Black"),
    Clothing(name: "Top Hat", price: 45.99, size: "L", color: "Gray"),
    Clothing(name: "Wide Brim Hat", price: 32.99, size: "One Size", color: "Beige")
]

// Array of shirts
let shirts: [Clothing] = [
    Clothing(name: "Graphic Tee", price: 15.99, size: "M", color: "Red"),
    Clothing(name: "Polo Shirt", price: 25.99, size: "L", color: "Navy"),
    Clothing(name: "Button-Up", price: 34.99, size: "XL", color: "White"),
    Clothing(name: "Tank Top", price: 12.99, size: "S", color: "Green"),
    Clothing(name: "Flannel Shirt", price: 29.99, size: "M", color: "Plaid"),
    Clothing(name: "Hoodie", price: 39.99, size: "L", color: "Gray"),
    Clothing(name: "Long Sleeve Tee", price: 19.99, size: "M", color: "Black"),
    Clothing(name: "Sweater", price: 45.99, size: "XL", color: "Beige"),
    Clothing(name: "Denim Shirt", price: 36.99, size: "L", color: "Light Blue"),
    Clothing(name: "Henley", price: 22.99, size: "M", color: "Olive"),
    Clothing(name: "V-Neck Tee", price: 14.99, size: "S", color: "Purple"),
    Clothing(name: "Baseball Tee", price: 18.99, size: "M", color: "White/Red")
]

// Array of pants
let pants: [Clothing] = [
    Clothing(name: "Jeans", price: 39.99, size: "32", color: "Dark Blue"),
    Clothing(name: "Chinos", price: 49.99, size: "34", color: "Khaki"),
    Clothing(name: "Sweatpants", price: 29.99, size: "L", color: "Gray"),
    Clothing(name: "Shorts", price: 19.99, size: "M", color: "Black"),
    Clothing(name: "Cargo Pants", price: 44.99, size: "36", color: "Olive"),
    Clothing(name: "Dress Pants", price: 59.99, size: "32", color: "Charcoal"),
    Clothing(name: "Joggers", price: 35.99, size: "M", color: "Navy"),
    Clothing(name: "Capri Pants", price: 25.99, size: "S", color: "White"),
    Clothing(name: "Corduroy Pants", price: 49.99, size: "34", color: "Brown"),
    Clothing(name: "Linen Pants", price: 39.99, size: "M", color: "Beige"),
    Clothing(name: "Overalls", price: 59.99, size: "L", color: "Denim"),
    Clothing(name: "Track Pants", price: 29.99, size: "M", color: "Black/White")
    ]

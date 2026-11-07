//
//  Volunteer.swift
//  Food Drive
//
//  Created by Joseph Swensen on 11/5/26.
//

import SwiftUI

struct Volunteer {
    let name: String
    let description: String
    let systemImage: String
}

let volunteers = [
    Volunteer(name: "Marisol Ortega", description: "Runs the front desk drop-off every morning.", systemImage: "person.crop.circle"),
    Volunteer(name: "Dev Patel", description: "Counts cans.", systemImage: "number"),
    Volunteer(name: "Hannah Brooks", description: "Made the posters for every classroom and the hallway by the cafeteria.", systemImage: "paintbrush"),
    Volunteer(name: "Tomas Reyes", description: "Drives the boxes to the food bank on Fridays.", systemImage: "car"),
    Volunteer(name: "Aiko Tanaka", description: "Tracks totals for each class.", systemImage: "list.number"),
    Volunteer(name: "Brigham Cole", description: "Sorts cans by type.", systemImage: "shippingbox"),
    Volunteer(name: "Leilani Kahale", description: "Asked three local stores to donate.", systemImage: "storefront") ]


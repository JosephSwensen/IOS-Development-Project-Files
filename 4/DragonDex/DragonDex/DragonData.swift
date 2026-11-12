//
//  DragonData.swift
//  DragonDex
//
//  Created by Joseph Swensen on 11/6/26.
//

struct Power: Hashable {
    let name: String
    let description: String
}

struct Dragon: Hashable {
    let name: String
    let species: String
    let fireRating: Int
    let lore: String
    let powers: [Power]
}

let dragons = [
    Dragon(name: "Ember", species: "Ridgeback", fireRating: 9,
           lore: "Ember sleeps inside volcanoes to stay warm.",
           powers: [
               Power(name: "Inferno Burst", description: "A blast of fire that fills a canyon."),
               Power(name: "Heat Shield", description: "A wall of hot air that stops arrows.")
           ]),
    Dragon(name: "Skyla", species: "Cloudwing", fireRating: 4,
           lore: "Skyla can fly for a week without landing.",
           powers: [
               Power(name: "Sky Dive", description: "A fast dive from above the clouds."),
               Power(name: "Gust", description: "A beat of the wings that knocks riders over.")
           ]),
    Dragon(name: "Grimtooth", species: "Cave Drake", fireRating: 7,
           lore: "Grimtooth guards a cave full of old coins.",
           powers: [
               Power(name: "Rock Slide", description: "A roar that shakes stones loose."),
               Power(name: "Night Sight", description: "Clear sight in total darkness.")
           ]),
    Dragon(name: "Frostfang", species: "Ice Wyrm", fireRating: 2,
           lore: "Frostfang breathes frost instead of fire.",
           powers: [
               Power(name: "Freeze Breath", description: "A cold blast that turns water to ice."),
               Power(name: "Snow Cloak", description: "A swirl of snow that hides the dragon.")
           ])
]

struct Rider: Identifiable {
    let id: String
    let name: String
    let dragon: Dragon
}


let riders: [Rider] = zip(["Aria", "Finn", "Rowan", "Luna"], dragons).map { name, dragon in
    Rider(id: name, name: name, dragon: dragon)
}

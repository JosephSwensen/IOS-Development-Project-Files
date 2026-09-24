//
//  SpaceshipScreen.swift
//  State Spaceship (aka Stateship)
//
//  Created by Jane Madsen on 9/29/25.
//

import SwiftUI

struct SpaceshipScreen: View {
    // Step 1: Add the ship's shared values here as @State properties.
    @State var shipHeading: String = ""
    @State var availablePower: Int = 10
    
    var body: some View {
        Form {
            Section("Helm Station") {
                HelmStation(shipHeading: $shipHeading)
            }

            Section("Weapons Station") {
                WeaponsStation(availablePower: $availablePower)
            }

            Section("Shield Station") {
                ShieldStation(availablePower: $availablePower)
            }

            Section("Engine Station") {
                EngineStation(availablePower: $availablePower)
            }

            Section("Ship Status") {
                Text("Heading: \(shipHeading.isEmpty ? "SYSTEM OFFLINE" : shipHeading)")
                Text("Available Power: \(availablePower)")
            }
        }
    }
}

struct HelmStation: View {
    @State var inChair = false
    @Binding var shipHeading: String
    var body: some View {
        HStack {
            CrewChair(crewIcon: "dog", inChair: $inChair)

            TextField("Heading", text: $shipHeading)
                .disabled(!inChair)
        }
    }
}

struct WeaponsStation: View {
    @State var inChair = false
    @State var weaponsOnline = false
    @Binding var availablePower: Int
    var body: some View {
        HStack {
            CrewChair(crewIcon: "cat", inChair: $inChair)

            VStack {
                switch weaponsOnline {
                case true:
                    Text("Weapons: ONLINE")
                case false:
                    Text("Weapons: OFFLINE")
                }
                

                Button("Power Weapons Up/Down") {
                    // Weapons cost 3 power when they are online.
                    if !weaponsOnline && availablePower >= 3 {
                        weaponsOnline = true
                        availablePower -= 3
                    } else {
                        weaponsOnline = false
                        availablePower += 3
                    }
                }
                .disabled(!inChair)

                Button("Fire!") {
                    if weaponsOnline == true {
                        print("PEW!")
                    }
                }
                .disabled(!inChair)
                .disabled(!weaponsOnline)
                
            }
            .buttonStyle(.borderless)
        }
    }
}

struct ShieldStation: View {
    @State var inChair = false
    @State var shieldPower = 0
    @Binding var availablePower: Int
    var body: some View {
        HStack {
            CrewChair(crewIcon: "lizard", inChair: $inChair)

            Stepper("Shield Power: \(shieldPower)", onIncrement: {
                // Move 1 power from the ship into the shields.
                if availablePower >= 1 {
                    shieldPower += 1
                    availablePower -= 1
                }
            }, onDecrement: {
                // Move 1 power from the shields back to the ship.
                if shieldPower >= 1 {
                    availablePower += 1
                    shieldPower -= 1
                }
            }).disabled(!inChair)
        }
    }
}

struct EngineStation: View {
    @State var inChair = false
    @State var enginePower: Int = 0
    @Binding var availablePower: Int
    var body: some View {
        HStack {
            CrewChair(crewIcon: "hare", inChair: $inChair)
            
            Stepper("Engine Power: \(enginePower)", onIncrement: {
                if availablePower >= 1 {
                    enginePower += 1
                    availablePower -= 1
                }
            }, onDecrement: {
                if enginePower >= 1 {
                    availablePower += 1
                    enginePower -= 1
                }
            }).disabled(!inChair)
        }
    }
}

struct CrewChair: View {
    var crewIcon: String
    @Binding var inChair: Bool

    var body: some View {
        Button {
            inChair.toggle()
        } label: {
            if inChair {
                Image(systemName: crewIcon)
            } else {
                Image(systemName: "person.slash")
            }
        }
        .buttonStyle(.borderless)
        .padding(5)
        .background {
            Circle()
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    SpaceshipScreen()
}

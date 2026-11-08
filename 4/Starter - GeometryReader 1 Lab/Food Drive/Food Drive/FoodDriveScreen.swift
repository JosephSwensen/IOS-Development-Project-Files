//
//  FoodDriveScreen.swift
//  Food Drive
//
//  Every width on this screen is a fixed number. It looks fine on
//  some phones and wrong on others. Read the lab for tonight's steps.
//

import SwiftUI

// the room 104 one is still here becasue you have to * to get the width right

// It would have made the grid for me so I wont have needed to use forEach

struct FoodDriveScreen: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var columnCount: Int {
        if horizontalSizeClass == .compact {
            return 2
        } else {
            return 3
        }
    }
    
    var rowCount: Int {
        if verticalSizeClass == .compact {
            return 3
        } else {
            return 4
        }
    }
    
    let cansCollected: CGFloat = 320
    let cansGoal: CGFloat = 500
    
    var progress: CGFloat {
        cansCollected / cansGoal
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("MTECH Food Drive")
                    .font(.largeTitle)
                    .bold()
                
                // Progress bar
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(Int(cansCollected)) of \(Int(cansGoal)) cans")
                        .font(.headline)
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.gray.opacity(0.3))
                            .containerRelativeFrame(.horizontal)
                            .frame(height: 24)
                        
                        Rectangle()
                            .fill(.green)
                            .containerRelativeFrame(.horizontal) { length, _ in length * progress }
                            .frame(height: 24)
                    }
                    .clipShape(.capsule)
                }
                
                // Stat tiles
                HStack() {
                    StatTile(title: "Days Left", value: "6")
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 16)
                    
                    StatTile(title: "Classes Giving", value: "14")
                        .containerRelativeFrame(.horizontal, count: 2, spacing: 16)
                }
                
                // Drop-off banner
                ViewThatFits {
                    HStack {
                        Image(systemName: "shippingbox")
                        VStack(alignment: .leading) {
                            Text("Drop off cans at the front desk:")
                            Text("2301 West Ashton Blvd, Lehi, UT 84048")
                        }
                        
                    }
                }
                .padding()
                .containerRelativeFrame(.horizontal, alignment: .leading)
                .background(.orange.opacity(0.2))
                .clipShape(.rect(cornerRadius: 12))
                
                HStack(spacing: 10) {
                    Text("Room 104")
                        .frame(width: 120, alignment: .leading)
                    
                    Text("Our Volunteers")
                        .font(.title2)
                    
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(.blue)
                            .frame(width: geometry.size.width * 0.6)
                        
                    }
                }
                .frame(height: 20)
                
                ForEach(0..<rowCount, id: \.self) { row in
                    VStack(spacing: 16) {
                        HStack(alignment: .top, spacing: 16) {
                            ForEach(0..<columnCount, id: \.self) {
                                column in
                                
                                if volunteers.count > (row * columnCount + column) {
                                    let volunteer = volunteers[row * columnCount + column]
                                    VolunteerCard(name: volunteer.name, description: volunteer.description, systemImage: volunteer.systemImage)
                                    
                                } else {
                                    Rectangle()
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .foregroundStyle(.clear)
                                        .background(.clear)
                                }
                            }
                        }
                    }
                }
            }
        }
        .containerRelativeFrame(.horizontal, count: columnCount, spacing: 16)
    }
}

#Preview {
    FoodDriveScreen()
}

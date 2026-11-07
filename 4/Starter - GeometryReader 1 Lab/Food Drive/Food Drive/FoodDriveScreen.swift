//
//  FoodDriveScreen.swift
//  Food Drive
//
//  Every width on this screen is a fixed number. It looks fine on
//  some phones and wrong on others. Read the lab for tonight's steps.
//

import SwiftUI

struct FoodDriveScreen: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var columnCount: CGFloat {
        if horizontalSizeClass == .compact {
            return 2
        } else {
            return 3
        }
    }
    
    let cansCollected: CGFloat = 320
    let cansGoal: CGFloat = 500
    
    var progress: CGFloat {
        cansCollected / cansGoal
    }
    
    var body: some View {
        GeometryReader { geometry in
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
                                .frame(width: geometry.size.width, height: 24)
                            
                            Rectangle()
                                .fill(.green)
                                .frame(width: geometry.size.width * progress, height: 24)
                        }
                        .clipShape(.capsule)
                    }
                    
                    // Stat tiles
                    HStack() {
                        StatTile(title: "Days Left", value: "6")
                            .frame(width: geometry.size.width / 2)
                        
                        StatTile(title: "Classes Giving", value: "14")
                            .frame(width: geometry.size.width / 2)
                    }
                    
                    // Drop-off banner
                    Text("Drop off cans at the front desk: 2301 West Ashton Blvd, Lehi, UT 84048")
                        .padding()
                        .frame(width: geometry.size.width, alignment: .leading)
                        .background(.orange.opacity(0.2))
                        .clipShape(.rect(cornerRadius: 12))
                    
                    HStack(spacing: 0) {
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
                    
                    ForEach(0..<rowCount, id: \.self)
                    VStack {
                        HStack {
                            
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    FoodDriveScreen()
}

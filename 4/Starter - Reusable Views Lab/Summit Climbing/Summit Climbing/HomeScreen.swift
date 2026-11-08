//
//  HomeScreen.swift
//  Summit Climbing
//

import SwiftUI

struct HomeScreen: View {
    @State private var statusMessage = "Welcome back!"

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    Text(statusMessage)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    GymCard(title: "Today's Hours", systemImage: "clock") {
                        Text("Open 6:00 AM to 10:00 PM")

                        Text("Kids' climb: 4:00 PM to 6:00 PM")
                            .foregroundStyle(.secondary)
                    }

                    GymCard(title: "Your Membership", systemImage: "person.crop.circle") {
                        Text("Monthly Pass")
                            .font(.title3)
                            .bold()

                        Text("Renews Dec 1")

                        Text("12 visits this month")
                            .foregroundStyle(.secondary)
                    }

                    GymCard(title: "Quick Actions", systemImage: "bolt") {
                        ActionRow(title: "Check In", systemImage: "clock") {
                            statusMessage = "You are checked in!"
                        }

                        ActionRow(title: "Book a Class", systemImage: "calendar") {
                            statusMessage = "Your spot in Intro to Bouldering is saved."
                        }

                        ActionRow(title: "Rent Gear") {
                            statusMessage = "Shoes and a harness are waiting at the front desk."
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Summit Climbing")
        }
    }
}

#Preview {
    HomeScreen()
}

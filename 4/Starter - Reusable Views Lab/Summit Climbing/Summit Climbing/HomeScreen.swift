//
//  HomeScreen.swift
//  Summit Climbing
//
//  This screen works, but the same cards and rows are copied
//  over and over. Read the lab for tonight's steps.
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

                    // Card: Today's Hours
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Today's Hours", systemImage: "clock")
                            .font(.headline)
                            .foregroundStyle(.orange)

                        Text("Open 6:00 AM to 10:00 PM")

                        Text("Kids' climb: 4:00 PM to 6:00 PM")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.orange.opacity(0.12))
                    .clipShape(.rect(cornerRadius: 12))

                    // Card: Your Membership
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Your Membership", systemImage: "person.crop.circle")
                            .font(.headline)
                            .foregroundStyle(.orange)

                        Text("Monthly Pass")
                            .font(.title3)
                            .bold()

                        Text("Renews Dec 1")

                        Text("12 visits this month")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.orange.opacity(0.12))
                    .clipShape(.rect(cornerRadius: 12))

                    // Card: Quick Actions
                    VStack(alignment: .leading, spacing: 8) {
                        Label("Quick Actions", systemImage: "bolt")
                            .font(.headline)
                            .foregroundStyle(.orange)

                        ActionRow(title: "Check in", action: statusMessage)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 6)
                            .contentShape(.rect)
                        }
                        .buttonStyle(.plain)

                        Button {
                            statusMessage = "Your spot in Intro to Bouldering is saved."
                        } label: {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundStyle(.orange)
                                    .frame(width: 28)

                                Text("Book a Class")

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 6)
                            .contentShape(.rect)
                        }
                        .buttonStyle(.plain)

                        Button {
                            statusMessage = "Shoes and a harness are waiting at the front desk."
                        } label: {
                            HStack {
                                Image(systemName: "arrow.right.circle")
                                    .foregroundStyle(.orange)
                                    .frame(width: 28)

                                Text("Rent Gear")

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 6)
                            .contentShape(.rect)
                        }
                        .buttonStyle(.plain)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.orange.opacity(0.12))
                    .clipShape(.rect(cornerRadius: 12))
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

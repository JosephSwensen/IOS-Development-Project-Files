import SwiftUI

struct RidersScreen: View {
    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        List(riders) { rider in
            VStack(alignment: .leading, spacing: 8) {
                Text(rider.name)
                    .font(.headline)
                Text(rider.dragon.name)
                Button("Find Dragon") {
                    mainRouter.selectedTab = .dragons
                }
            }
        }
        .navigationTitle("Riders")
    }
}

import SwiftUI

struct SettingsScreen: View {
    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        NavigationStack {
            Text("Settings")
                .font(.title)
                .navigationTitle("Settings")
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            mainRouter.isShowingSettings = false
                        }
                    }
                }
        }
    }
}

import SwiftUI

struct MainTabView: View {
    @State var mainRouter = MainRouter()
    @State var dragonsRouter = DragonsRouter()

    var body: some View {
        TabView(selection: $mainRouter.selectedTab) {
            NavigationStack(path: $dragonsRouter.navigationPath) {
                DragonListScreen()
                    .navigationDestination(for: DragonsRouter.Route.self) { route in
                        dragonsRouter.view(for: route)
                    }
            }
            .tabItem {
                Label("Dragons", systemImage: "flame")
            }
            .tag(MainRouter.Tab.dragons)

            NavigationStack {
                RidersScreen()
            }
            .tabItem {
                Label("Riders", systemImage: "person.2")
            }
            .tag(MainRouter.Tab.riders)
        }
        .sheet(isPresented: $mainRouter.isShowingSettings) {
            SettingsScreen()
                .environment(mainRouter)
        }
        .environment(mainRouter)
        .environment(dragonsRouter)
    }
}

#Preview {
    MainTabView()
}

import SwiftUI

struct DragonListScreen: View {
    @Environment(DragonsRouter.self) private var router
    @Environment(MainRouter.self) private var mainRouter

    var body: some View {
        List(dragons, id: \.name) { dragon in
            Button(dragon.name) {
                router.navigateTo(route: .dragon(dragon))
            }
        }
        .navigationTitle("Dragons")
        .toolbar {
            Button("Random Dragon") {
                if let random = dragons.randomElement() {
                    router.navigateTo(route: .dragon(random))
                }
            }
            Button("Settings", systemImage: "gear") {
                mainRouter.isShowingSettings = true
            }
        }
    }
}

#Preview {
    MainTabView()
}

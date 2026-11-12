import SwiftUI

struct PowerDetailScreen: View {
    @Environment(DragonsRouter.self) private var router
    let power: Power

    var body: some View {
        VStack {
            Text(power.name)
            Text(power.description)
            Button("Back to Dragons") {
                router.goHome()
            }
        }
        .navigationTitle(power.name)
    }
}

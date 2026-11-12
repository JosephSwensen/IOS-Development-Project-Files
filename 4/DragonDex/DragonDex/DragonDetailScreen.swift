import SwiftUI

struct DragonDetailScreen: View {
    @Environment(DragonsRouter.self) private var router
    let dragon: Dragon

    var body: some View {
        VStack {
            Text(dragon.name)
            Text(dragon.species)
            Text("\(dragon.fireRating)")
            Text(dragon.lore)
            List(dragon.powers, id: \.name) { power in
                Button(power.name) {
                    router.navigateTo(route: .power(power))
                }
            }
        }
        .navigationTitle(dragon.name)
    }
}

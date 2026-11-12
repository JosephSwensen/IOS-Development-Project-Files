import SwiftUI

@MainActor
@Observable
final class DragonsRouter {
    enum Route: Hashable {
        case dragon(Dragon)
        case power(Power)
    }

    var navigationPath = NavigationPath()

    @ViewBuilder
    func view(for route: Route) -> some View {
        switch route {
        case .dragon(let dragon):
            DragonDetailScreen(dragon: dragon)
        case .power(let power):
            PowerDetailScreen(power: power)
        }
    }

    func navigateTo(route: Route) {
        navigationPath.append(route)
    }

    func goHome() {
        navigationPath = NavigationPath()
    }
}

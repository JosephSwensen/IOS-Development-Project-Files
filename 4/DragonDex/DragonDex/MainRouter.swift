import Observation

@MainActor
@Observable
final class MainRouter {
    enum Tab: Hashable {
        case dragons
        case riders
    }

    var selectedTab: Tab = .dragons
    var isShowingSettings = false
}

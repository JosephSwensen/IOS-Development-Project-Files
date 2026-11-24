import SwiftUI

struct TrackerButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
            .background(Color.accentColor)
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
    }
}

extension ButtonStyle where Self == TrackerButtonStyle {
    static var tracker: TrackerButtonStyle {
        TrackerButtonStyle()
    }
}

import SwiftUI

struct TopicRowView: View {
    let title: String
    let icon: String
    let isStudied: Bool

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
            Text(title)
            Spacer()
            if isStudied {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                    .accessibilityLabel("Studied")
            }
        }
    }
}

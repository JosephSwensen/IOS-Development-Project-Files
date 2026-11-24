import SwiftUI

struct AddPlayerView: View {
    @Environment(\.dismiss) var dismiss
    @State var viewModel = AddPlayerViewModel()

    let onAdd: (Player) -> Void

    let columns = [GridItem(.adaptive(minimum: 64))]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack() {
                    TextField("Player name", text: $viewModel.name)
                        .textFieldStyle(.roundedBorder)

                    Text("Choose an icon")
                        .font(.headline)

                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(viewModel.icons, id: \.self) { icon in
                            Button {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    viewModel.selectedIcon = icon
                                }
                            } label: {
                                Image(systemName: icon)
                                    .font(.title)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 64)
                                    .background(Color.secondary.opacity(0.1))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Add Player")
            .toolbar {
                ToolbarItem() {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem() {
                    Button("Add") {
                        if let player = viewModel.makePlayer() {
                            onAdd(player)
                            dismiss()
                        }
                    }
                    .disabled(!viewModel.canAddPlayer)
                }
            }
        }
    }
}

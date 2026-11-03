import SwiftUI

// This takes the ViewModel to read its stats bindings are not needed because it does not edit them.
struct ReadingStatsView: View {
    let viewModel: ReadingLogViewModel

    var body: some View {
        Text("Books finished: \(viewModel.booksFinishedCount)")
        Text("Pages read: \(viewModel.pagesRead)")
    }
}

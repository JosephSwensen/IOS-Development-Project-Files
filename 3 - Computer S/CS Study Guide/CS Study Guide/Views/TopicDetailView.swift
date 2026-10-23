import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    @Binding var studiedTopicIDs: Set<String>

    private var isStudied: Bool {
        studiedTopicIDs.contains(topic.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 28) {
                LessonSectionView(title: "Summary", text: topic.summary, placeholder: "Your summary will appear here.")
                ForEach(topic.questions) { item in
                    LessonSectionView(title: item.question, text: item.answer, placeholder: "Your answer will appear here.")
                }
                LessonSectionView(title: "Example", text: topic.example, placeholder: "Your own example will appear here.")
                Button(isStudied ? "Mark as Not Studied" : "Mark as Studied") {
                    toggleStudied()
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle(topic.title)
    }

    // Course 3 tool: Set. Insert avoids duplicate progress; remove lets the
    // reader undo it. Set lookup, insertion, and removal are O(1) on average.
    private func toggleStudied() {
        if isStudied {
            studiedTopicIDs.remove(topic.id)
        } else {
            studiedTopicIDs.insert(topic.id)
        }
    }
}

struct LessonSectionView: View {
    let title: String
    let text: String
    let placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            Text(text.isEmpty ? placeholder : text)
                .foregroundStyle(text.isEmpty ? .secondary : .primary)
        }
    }
}

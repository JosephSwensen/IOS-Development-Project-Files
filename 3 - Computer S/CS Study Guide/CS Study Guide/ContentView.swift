import SwiftUI

struct ContentView: View {
    private let topics: [Topic]
    @State private var searchText = ""
    // Course 3 tool: Set. Unique topic IDs track studied topics for this session.
    // Membership checks drive the home checkmarks; insert/remove are in the detail view.
    @State private var studiedTopicIDs: Set<String> = []

    init(source: any TopicSource) {
        topics = source.loadTopics()
    }

    var body: some View {
        let results = TopicSearch.search(topics, for: searchText)
        NavigationStack {
            List {
                Section {
                    Text("Choose a topic to start reviewing.")
                    Text("\(studiedTopicIDs.count) of \(topics.count) studied this session")
                        .foregroundStyle(.secondary)
                }
                Section("Topics") {
                    ForEach(results) { topic in
                        NavigationLink {
                            TopicDetailView(topic: topic, studiedTopicIDs: $studiedTopicIDs)
                        } label: {
                            TopicRowView(
                                title: topic.title,
                                icon: topic.icon,
                                isStudied: studiedTopicIDs.contains(topic.id)
                            )
                        }
                    }
                    if results.isEmpty {
                        Text("No topics found. Try another search.")
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search topics and answers")
            .navigationTitle("CS Study Guide")
        }
    }
}

#Preview("All Topics") {
    ContentView(source: StudyGuideTopics())
}

#Preview("Sample Data") {
    ContentView(source: SampleTopics())
}

import Foundation

enum TopicSearch {
    // Course 3 tool: Linear Search. Checks each topic using our own loop.
    // O(n) topic visits; text matching also depends on the amount of text
    // and query length. Results drive the home screen's visible rows.
    static func search(_ topics: [Topic], for text: String) -> [Topic] {
        let query = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return topics }
        var results: [Topic] = []
        for topic in topics {
            var matches = topic.title.localizedCaseInsensitiveContains(query)
                || topic.summary.localizedCaseInsensitiveContains(query)
                || topic.example.localizedCaseInsensitiveContains(query)
            for item in topic.questions {
                if item.question.localizedCaseInsensitiveContains(query)
                    || item.answer.localizedCaseInsensitiveContains(query) {
                    matches = true
                    break
                }
            }
            if matches {
                results.append(topic)
            }
        }
        return results
    }
}

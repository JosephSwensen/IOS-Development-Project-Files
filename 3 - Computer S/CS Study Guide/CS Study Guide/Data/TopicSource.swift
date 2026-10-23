// Course 3 tool: Dependency Inversion.
// Views depend on this small contract. Real and sample sources can be
// substituted without changing navigation, search, or lesson rendering.
protocol TopicSource {
    func loadTopics() -> [Topic]
}

struct SampleTopics: TopicSource {
    func loadTopics() -> [Topic] {
        [
            Topic(
                id: "sample", title: "Sample Topic", icon: "book",
                summary: "Preview summary.",
                questions: [
                    QuestionAnswer(id: "sample-question", question: "Sample question?", answer: "Preview answer.")
                ],
                example: "Preview example."
            )
        ]
    }
}

// Original student answers preserved with spelling and punctuation fixes.
// Short summaries and examples added with assistance.
struct StudyGuideTopics: TopicSource {
    func loadTopics() -> [Topic] {
        Self.topics
    }

    static let topics: [Topic] = [
        Topic(
            id: "hardware",
            title: "Hardware",
            icon: "desktopcomputer",
            summary: "Hardware is the physical parts of a computer. These parts work together to run programs.",
            questions: [
                QuestionAnswer(id: "hardware-1", question: "What are the main parts of a computer, and what does each one do?", answer: "RAM, storage, CPU. RAM takes the code from storage and runs it, and when it is done running a part, it moves on to the next part of code on storage. Storage stores the code long term. The CPU actually computes the code."),
                QuestionAnswer(id: "hardware-2", question: "What's the difference between memory and storage?", answer: "Memory is only short term, so while your device is running. Storage is long term, like if you turn the device off, it will still be saved."),
                QuestionAnswer(id: "hardware-3", question: "Why do computers use binary?", answer: "because computers use transister which can eathier be on or off so 1 or 0 and and our code gets trasulated into 1s and 0s.")
            ],
            example: "RAM is like a desk for work you are doing now. Storage is like a cabinet where you keep files."
        ),
        Topic(
            id: "memory",
            title: "Memory",
            icon: "memorychip",
            summary: "Memory holds data while a program runs. Swift manages values and references in different ways.",
            questions: [
                QuestionAnswer(id: "memory-1", question: "What are the stack and the heap, and what goes in each?", answer: "the stack is memory that store things that only need to be stored for a short time while the heap is for long term momory for things that need to be stored for a while. Structs are stored in the stack while classes are stored in the heap"),
                QuestionAnswer(id: "memory-2", question: "What happens when you copy a struct vs. copy a class?", answer: "When you copy a struct, it does not remember the original, while when you copy a class, it remembers the original and can pull from it."),
                QuestionAnswer(id: "memory-3", question: "How does ARC decide when to free a class instance?", answer: "By tracking the number of strong references pointing to it.")
            ],
            example: "Copying a struct is like copying a shopping list. Editing one list does not edit the other."
        ),
        Topic(
            id: "algorithms",
            title: "Algorithms and Big-O",
            icon: "magnifyingglass",
            summary: "Algorithms are steps for solving problems. Big-O describes how their work grows with more input.",
            questions: [
                QuestionAnswer(id: "algorithms-1", question: "What is an algorithm, and what does Big-O describe?", answer: "It is a set of instructions, and Big-O describes how complex it is."),
                QuestionAnswer(id: "algorithms-2", question: "How do linear search and binary search work, and what's the Big-O of each?", answer: "Linear search works by looking at every item in a data base so for every item it adds one step like 100 items take 100 steps, while binary splits the information up and tries to find the information."),
                QuestionAnswer(id: "algorithms-3", question: "Why is looking something up in a Set or Dictionary faster than searching an array?", answer: "Because sets cannot have duplicates, and dictionaries have keys that cannot be the same as other keys. But arrays can have the same items, so that is why they are not as fast.")
            ],
            example: "Looking through a row of lockers one at a time is like linear search."
        ),
        Topic(
            id: "systems",
            title: "Systems Architecture",
            icon: "gearshape.2",
            summary: "The operating system manages a computer's resources. Processes and threads let programs run.",
            questions: [
                QuestionAnswer(id: "systems-1", question: "What does an operating system do?", answer: "It directs which processes should be run on what core and thread."),
                QuestionAnswer(id: "systems-2", question: "What's the difference between a program, a process and a thread?", answer: "A program is the code. A process is how it is run. A thread is running the process on the core of the CPU, and there are a lot of them."),
                QuestionAnswer(id: "systems-3", question: "Why does UI work have to happen on the main thread?", answer: "Because it is the first thing that needs to show like it is the fist thing that needs to be ran")
            ],
            example: "The operating system is like a manager deciding which jobs get time to use shared equipment."
        ),
        Topic(
            id: "internet",
            title: "The Internet",
            icon: "network",
            summary: "The internet lets devices exchange data. Apps use requests and responses to communicate with servers.",
            questions: [
                QuestionAnswer(id: "internet-1", question: "What happens when an app asks a server for data?", answer: "It uses Apple’s Network framework and asks the server for the data it needs and the server sends the data to the app"),
                QuestionAnswer(id: "internet-2", question: "What do IP addresses and DNS do?", answer: "IP assigns a number to a device so data can be sent to it, and DNS translates what is sent to the IP."),
                QuestionAnswer(id: "internet-3", question: "What is an API, and what does HTTPS add to HTTP?", answer: "An API is a set of rules for how software communicates with other software. HTTPS adds security to HTTP.")
            ],
            example: "A weather app asks a server for the forecast, and the server sends it back."
        ),
        Topic(
            id: "solid",
            title: "SOLID",
            icon: "building.2",
            summary: "SOLID is five principles for organizing code. They help make code easier to change.",
            questions: [
                QuestionAnswer(id: "solid-1", question: "What does each letter in SOLID stand for?", answer: "S: Single Responsibility\nO: Open/Closed\nL: Liskov Substitution\nI: Interface Segregation\nD: Dependency Inversion"),
                QuestionAnswer(id: "solid-2", question: "Why do these principles make code easier to change?", answer: "Because they are guidelines to make it easy to change."),
                QuestionAnswer(id: "solid-3", question: "What does one of the principles look like in Swift code?", answer: "struct Worker {\n    func stockTheBack() {\n    }\n}")
            ],
            example: "Single Responsibility is like having one worker stock shelves and another handle payroll."
        )
    ]
}

import Observation

// Without @Observable, tapping Finish left the book and stats unchanged on screen because SwiftUI was not tracking changes to this class's properties.
// 1. Tapping Finish calls viewModel.markFinished(book).
// 2. markFinished finds the book and sets isFinished to true.
// 3. @Observable lets SwiftUI know the books changed.
// 4. SwiftUI updates ReadingStatsView, which reads the calculated stats again.
// 5. Its Text views show the new books finished count and pages read.
@Observable
class ReadingLogViewModel {
    var books: [Book] = [
        Book(title: "Hatchet", author: "Gary Paulsen", pageCount: 195, isFinished: true),
        Book(title: "The Hobbit", author: "J.R.R. Tolkien", pageCount: 310, isFinished: false),
        Book(title: "Holes", author: "Louis Sachar", pageCount: 233, isFinished: true),
        Book(title: "Ender's Game", author: "Orson Scott Card", pageCount: 324, isFinished: false)
    ]

    var currentlyReading: [Book] {
        books.filter { !$0.isFinished }
    }

    var finishedBooks: [Book] {
        books.filter { $0.isFinished }
    }

    var booksFinishedCount: Int {
        finishedBooks.count
    }

    var pagesRead: Int {
        finishedBooks.reduce(0) { $0 + $1.pageCount }
    }

    func addBook(title: String, author: String, pageCount: Int) {
        let newBook = Book(title: title, author: author, pageCount: pageCount, isFinished: false)
        books.append(newBook)
    }

    func markFinished(_ book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isFinished = true
        }
    }
    func canAdd(title: String, author: String, pageCount: Int) -> Bool {
        var canAddBool: Bool = true
        if title.isEmpty {
            canAddBool = false
        } else if author.isEmpty {
            canAddBool = false
        } else if pageCount == 0 {
            canAddBool = false
        } else if books.contains(where: { $0.title.lowercased() == title.lowercased() }) {
            canAddBool = false
        }
        
        return canAddBool
    }
}

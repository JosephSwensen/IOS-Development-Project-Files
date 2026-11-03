import Foundation

struct Book: Identifiable {
    let id = UUID()
    var title: String
    var author: String
    var pageCount: Int
    var isFinished: Bool
}

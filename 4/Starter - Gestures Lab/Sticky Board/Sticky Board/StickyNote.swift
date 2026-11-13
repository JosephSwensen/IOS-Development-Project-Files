//
//  StickyNote.swift
//  Sticky Board
//

import SwiftUI

struct StickyNote: Identifiable {
    let id = UUID()
    var text: String
    var color: Color
    var isFavorite = false
    var offset = CGSize.zero
}

extension StickyNote {
    static let samples = [
        StickyNote(text: "Buy milk", color: .yellow),
        StickyNote(text: "Call the dentist", color: .pink),
        StickyNote(text: "Lab due Friday", color: .mint),
        StickyNote(text: "Water the plants", color: .orange)
    ]
}

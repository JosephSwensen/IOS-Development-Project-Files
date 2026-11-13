//
//  BoardScreen.swift
//  Sticky Board
//

import SwiftUI

struct BoardScreen: View {
    @State private var notes = StickyNote.samples
    @State private var selectedNoteID: UUID?
    @State private var isShowingTips = false

    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Sticky Board")
                    .font(.largeTitle.bold())
                Spacer()
// it is better because you dont have to add a text view or any view to see what you are clicking the button just has all of that.
                    Button("Add Note") {
                        addNote()
                    }
            }

            HStack {
                Image(systemName: "lightbulb")
                Text("Tips")
                Spacer()
                Image(systemName: isShowingTips ? "chevron.up" : "chevron.down")
            }
            .font(.title3)
            .onTapGesture {
                withAnimation {
                    isShowingTips.toggle()
                }
            }

            if isShowingTips {
                Text("Tap a note to select it. Double tap a note to make it a favorite. Press and hold a note to delete it.")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach($notes) { $note in
                    NoteCard(
                        note: $note,
                        isSelected: note.id == selectedNoteID,
                        onSelect: {
                            selectedNoteID = note.id
                        },
                        onDelete: {
                            delete(note)
                        }
                    )
                }
            }

            Spacer()
        }
        .padding()
    }

    private func addNote() {
        let noteColors: [Color] = [.yellow, .pink, .mint, .orange, .cyan]
        let newNote = StickyNote(
            text: "New note \(notes.count + 1)",
            color: noteColors.randomElement() ?? .yellow
        )
        withAnimation {
            notes.append(newNote)
        }
    }

    private func delete(_ note: StickyNote) {
        if selectedNoteID == note.id {
            selectedNoteID = nil
        }
        notes.removeAll { $0.id == note.id }
    }
}

#Preview {
    BoardScreen()
}

//
//  NoteCard.swift
//  Sticky Board
//

import SwiftUI

struct NoteCard: View {
    @Binding var note: StickyNote
    var isSelected: Bool
    var onSelect: () -> Void
    var onDelete: () -> Void
    @GestureState var dragOffset = CGSize.zero
    
    @State var isPressing = false

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Text(note.text)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 140)
                .background(note.color, in: .rect(cornerRadius: 12))

            if note.isFavorite {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
                    .padding(8)
                    .transition(.scale)
            }
        }
        .offset(x: note.offset.width + dragOffset.width, y: note.offset.height + dragOffset.height)
        
        .gesture(
            DragGesture()
                .updating($dragOffset) { value, state, _ in
                    state = value.translation
                }
        
                .onEnded { value in

                    if abs(value.translation.width) > 300 {
                        withAnimation {
                           onDelete()
                        }
                    } else {
                        note.offset.width += value.translation.width
                        note.offset.height += value.translation.height
                    }
                }
        )
        .onTapGesture {
            onSelect()
        }
        .onTapGesture(count: 2) {
            note.isFavorite.toggle()
        }
        .onLongPressGesture(minimumDuration: 1) {
            onDelete()
        } onPressingChanged: { pressing in
            isPressing = pressing
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.blue, lineWidth: isSelected ? 4 : 0)
        }
        .shadow(radius: 2)
        .scaleEffect(isPressing ? 0.9 : 1)
        .opacity(isPressing ? 0.6 : 1)
        .animation(.easeInOut, value: isPressing)
        .animation(.bouncy, value: dragOffset)
    }
}

#Preview {
    NoteCard(
        note: .constant(StickyNote.samples[0]),
        isSelected: true,
        onSelect: {},
        onDelete: {}
    )
    .padding()
}

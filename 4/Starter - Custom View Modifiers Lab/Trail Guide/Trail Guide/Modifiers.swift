//
//  Modifiers.swift
//  Trail Guide
//
//  Created by Joseph Swensen on 11/3/26.
//

import SwiftUI

struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .bold()
            .foregroundStyle(.teal)
            .padding(.top, 4)
    }
}

struct PanelStyle: ViewModifier {
    let tint: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.green.opacity(0.12))
            .clipShape(.rect(cornerRadius: 20))
    }
}

struct StatLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
    }
}

struct PillStyle: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .font(.caption)
            .bold()
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(color)
            .clipShape(.capsule)
    }
}

extension View {
    func sectionHeaderStyle() -> some View {
        modifier(SectionHeaderStyle())
    }

    func panelStyle(tint: Color = .green) -> some View {
        modifier(PanelStyle(tint: tint))
    }

    func statLabelStyle() -> some View {
        modifier(StatLabelStyle())
    }

    func pillStyle(color: Color) -> some View {
        modifier(PillStyle(color: color))
    }
}

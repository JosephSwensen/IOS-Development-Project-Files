//
//  buttonStyles.swift
//  Button Styles Lab
//
//  Created by Joseph Swensen on 11/3/26.
//

import SwiftUI

struct ChunkyButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                configuration.role == .destructive ? .red : color,
                in: RoundedRectangle(cornerRadius: 12)
            )
            .shadow(
                color: configuration.isPressed ? .clear : .black.opacity(0.25),
                radius: 12,
                y: 4
            )
            .offset(y: configuration.isPressed ? 4 : 0)
    }
}

struct CircleIconButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .frame(width: 44, height: 44)
            .background(.orange, in: Circle())
            .scaleEffect(configuration.isPressed ? 0.85 : 1)
    }
}

struct ChipButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(isSelected ? Color.white : Color.primary)
            .padding()
            .background(
                isSelected ? Color.orange : Color.gray.opacity(0.2),
                in: Capsule()
            )
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension ButtonStyle where Self == ChunkyButtonStyle {
    static func chunky(color: Color = .orange) -> ChunkyButtonStyle {
        ChunkyButtonStyle(color: color)
    }
}

extension ButtonStyle where Self == CircleIconButtonStyle {
    static var circleIcon: CircleIconButtonStyle {
        CircleIconButtonStyle()
    }
}

extension ButtonStyle where Self == ChipButtonStyle {
    static func chip(isSelected: Bool) -> ChipButtonStyle {
        ChipButtonStyle(isSelected: isSelected)
    }
}

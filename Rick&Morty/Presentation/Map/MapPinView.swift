//
//  MapPinView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import SwiftUI

struct MapPinView: View {
    let pin: CharacterMapPin
    let isSelected: Bool

    private var pinColor: Color {
        switch pin.status {
        case .alive:   return .green
        case .dead:    return .red
        case .unknown: return .gray
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .fill(pinColor.opacity(isSelected ? 1.0 : 0.85))
                    .frame(width: isSelected ? 44 : 32, height: isSelected ? 44 : 32)
                    .shadow(color: pinColor.opacity(0.5), radius: isSelected ? 8 : 4)

                AsyncImage(url: pin.image) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Image(systemName: "person.fill")
                        .foregroundStyle(.white)
                }
                .frame(width: isSelected ? 36 : 26, height: isSelected ? 36 : 26)
                .clipShape(Circle())
            }

            // Triángulo del pin
            Triangle()
                .fill(pinColor.opacity(isSelected ? 1.0 : 0.85))
                .frame(width: 12, height: 8)
        }
        .scaleEffect(isSelected ? 1.2 : 1.0)
        .animation(.spring(response: 0.3), value: isSelected)
    }
}

private struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.closeSubpath()
        }
    }
}

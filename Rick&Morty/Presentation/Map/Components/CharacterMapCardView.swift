//
//  CharacterMapCardView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//


//
//  CharacterMapCardView.swift
//  Rick&Morty
//

import SwiftUI

struct CharacterMapCardView: View {
    let pin: CharacterMapPin
    let onDismiss: () -> Void

    private var statusColor: Color {
        switch pin.status {
        case .alive:   return .green
        case .dead:    return .red
        case .unknown: return .gray
        }
    }

    var body: some View {
        HStack(spacing: 14) {
            AsyncImage(url: pin.image) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(ProgressView())
            }
            .frame(width: 64, height: 64)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 5) {
                Text(pin.name)
                    .font(.headline)
                    .lineLimit(1)

                HStack(spacing: 5) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 8, height: 8)
                    Text(pin.status.rawValue)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Label(pin.locationName, systemImage: "mappin.circle.fill")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.gray.opacity(0.6))
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 18)
                .fill(.regularMaterial)
                .shadow(color: .black.opacity(0.12), radius: 12, y: 4)
        )
    }
}

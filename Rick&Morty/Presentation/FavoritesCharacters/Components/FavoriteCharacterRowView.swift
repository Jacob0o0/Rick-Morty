//
//  FavoriteCharacterRowView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import SwiftUI

struct FavoriteCharacterRowView: View {
    let character: FavoriteCharacterE

    private var statusColor: Color {
        switch character.status.lowercased() {
        case "alive":  return .green
        case "dead":   return .red
        default:       return .gray
        }
    }

    var body: some View {
        HStack(spacing: 14) {
            AsyncImage(url: character.image) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .overlay(ProgressView())
            }
            .frame(width: 70, height: 70)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 6) {
                Text(character.name)
                    .font(.headline)
                    .lineLimit(1)

                HStack(spacing: 6) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 8, height: 8)
                    Text(character.status)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Text(character.species)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Capsule())
            }

            Spacer()

            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
                .font(.subheadline)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground))
        )
    }
}

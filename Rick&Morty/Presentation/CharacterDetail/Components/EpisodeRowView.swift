//
//  EpisodeRowView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI

struct EpisodeRowView: View {
    let episode: Episode
    let isWatched: Bool
    let onToggleWatched: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(episode.episodeCode)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(episode.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .strikethrough(isWatched, color: .secondary)
                    .foregroundStyle(isWatched ? .secondary : .primary)
                Text(episode.airDate)
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }

            Spacer()

            Button {
                onToggleWatched()
            } label: {
                Image(systemName: isWatched ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundStyle(isWatched ? .green : .gray)
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(isWatched ? Color.green.opacity(0.06) : Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 2, y: 1)
        )
    }
}

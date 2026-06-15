//
//  CharacterDetailView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI
import Swinject

struct CharacterDetailView: View {
    @State private var viewModel: CharacterDetailViewModel

    init(character: Character) {
        let episodesUseCase = DIContainer.shared.resolve(GetEpisodesUseCaseProtocol.self)!
        _viewModel = State(initialValue: CharacterDetailViewModel(
            character: character,
            getEpisodesUseCase: episodesUseCase
        ))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                AsyncImage(url: viewModel.character.image) { image in
                    image.resizable().aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .overlay(ProgressView())
                }
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .clipped()

                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .top) {
                        Text(viewModel.character.name)
                            .font(.system(size: 34, weight: .bold))
                        Spacer()
                        Button {
                            viewModel.toggleFavorite()
                        } label: {
                            Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(viewModel.isFavorite ? .red : .gray)
                                .padding(8)
                        }
                        .buttonStyle(.plain)
                        .accessibilityIdentifier("favoriteButton")
                    }

                    infoSection
                    locationSection
                    episodesSection
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchEpisodes()
        }
    }

    // MARK: - Subviews

    private var infoSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Información")
                .font(.headline)

            HStack {
                Circle()
                    .fill(statusColor)
                    .frame(width: 10, height: 10)
                Text(viewModel.character.status.rawValue)
                Spacer()
                Text(viewModel.character.species)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }

            Text("Género: \(viewModel.character.gender.rawValue)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Localización")
                .font(.headline)
            Label("Origen: \(viewModel.character.origin.name)", systemImage: "mappin.circle")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Label("Última ubicación: \(viewModel.character.location.name)", systemImage: "location.circle")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }

    private var episodesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Episodios (\(viewModel.character.episode.count))")
                .font(.headline)

            if viewModel.isLoadingEpisodes {
                HStack {
                    ProgressView()
                    Text("Cargando episodios...")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()

            } else if let error = viewModel.episodeError {
                VStack(spacing: 8) {
                    Image(systemName: "exclamationmark.triangle")
                        .foregroundStyle(.orange)
                    Text(error)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Button("Reintentar") {
                        Task { await viewModel.fetchEpisodes() }
                    }
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity)
                .padding()

            } else if viewModel.episodes.isEmpty {
                Text("No se encontraron episodios.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

            } else {
                ForEach(viewModel.episodes) { episode in
                    EpisodeRowView(
                        episode: episode,
                        isWatched: viewModel.isWatched(episode: episode),
                        onToggleWatched: { viewModel.toggleWatched(episode: episode) }
                    )
                }
            }
        }
    }

    private var statusColor: Color {
        switch viewModel.character.status {
        case .alive:   return .green
        case .dead:    return .red
        case .unknown: return .gray
        }
    }
}

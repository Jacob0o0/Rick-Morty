//
//  CharacterDetailViewModel.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class CharacterDetailViewModel {
    let character: Character
    var episodes: [Episode] = []
    var isLoadingEpisodes = false
    var episodeError: String? = nil

    // Persistence state
    var isFavorite: Bool = false
    var watchedEpisodeIds: Set<Int> = []

    private let getEpisodesUseCase: GetEpisodesUseCaseProtocol
    private let persistence = PersistenceService.shared

    init(character: Character, getEpisodesUseCase: GetEpisodesUseCaseProtocol) {
        self.character = character
        self.getEpisodesUseCase = getEpisodesUseCase
        self.isFavorite = persistence.isFavorite(characterId: character.id)
    }

    func fetchEpisodes() async {
        guard !character.episode.isEmpty else { return }
        let urls = character.episode.compactMap { URL(string: $0) }
        guard !urls.isEmpty else { return }

        isLoadingEpisodes = true
        episodeError = nil

        do {
            episodes = try await getEpisodesUseCase.execute(urls: urls)
            // Load watched state after fetching
            watchedEpisodeIds = Set(episodes.map(\.id).filter { persistence.isWatched(episodeId: $0) })
        } catch {
            episodeError = "No se pudieron cargar los episodios."
        }

        isLoadingEpisodes = false
    }

    func toggleFavorite() {
        persistence.toggleFavorite(character: character)
        isFavorite = persistence.isFavorite(characterId: character.id)
    }

    func toggleWatched(episode: Episode) {
        persistence.toggleWatched(episodeId: episode.id)
        if watchedEpisodeIds.contains(episode.id) {
            watchedEpisodeIds.remove(episode.id)
        } else {
            watchedEpisodeIds.insert(episode.id)
        }
    }

    func isWatched(episode: Episode) -> Bool {
        watchedEpisodeIds.contains(episode.id)
    }
}

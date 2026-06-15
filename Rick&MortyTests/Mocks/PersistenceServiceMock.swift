//
//  PersistenceServiceMock.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
@testable import Rick_Morty

final class PersistenceServiceMock: PersistenceServiceProtocol {

    // MARK: - Estado simulado

    var favoriteIds: Set<Int> = []
    var watchedEpisodeIds: Set<Int> = []

    // MARK: - Espías (Spy)

    private(set) var isFavoriteCalledWith: [Int] = []
    private(set) var addFavoriteCalledWith: [Character] = []
    private(set) var removeFavoriteCalledWith: [Int] = []
    private(set) var toggleFavoriteCalledWith: [Character] = []

    private(set) var isWatchedCalledWith: [Int] = []
    private(set) var markAsWatchedCalledWith: [Int] = []
    private(set) var unmarkAsWatchedCalledWith: [Int] = []
    private(set) var toggleWatchedCalledWith: [Int] = []

    // MARK: - Favorites

    func isFavorite(characterId: Int) -> Bool {
        isFavoriteCalledWith.append(characterId)
        return favoriteIds.contains(characterId)
    }

    func addFavorite(character: Character) {
        addFavoriteCalledWith.append(character)
        favoriteIds.insert(character.id)
    }

    func removeFavorite(characterId: Int) {
        removeFavoriteCalledWith.append(characterId)
        favoriteIds.remove(characterId)
    }

    func toggleFavorite(character: Character) {
        toggleFavoriteCalledWith.append(character)

        if favoriteIds.contains(character.id) {
            favoriteIds.remove(character.id)
        } else {
            favoriteIds.insert(character.id)
        }
    }

    // MARK: - Watched Episodes

    func isWatched(episodeId: Int) -> Bool {
        isWatchedCalledWith.append(episodeId)
        return watchedEpisodeIds.contains(episodeId)
    }

    func markAsWatched(episodeId: Int) {
        markAsWatchedCalledWith.append(episodeId)
        watchedEpisodeIds.insert(episodeId)
    }

    func unmarkAsWatched(episodeId: Int) {
        unmarkAsWatchedCalledWith.append(episodeId)
        watchedEpisodeIds.remove(episodeId)
    }

    func toggleWatched(episodeId: Int) {
        toggleWatchedCalledWith.append(episodeId)

        if watchedEpisodeIds.contains(episodeId) {
            watchedEpisodeIds.remove(episodeId)
        } else {
            watchedEpisodeIds.insert(episodeId)
        }
    }
}

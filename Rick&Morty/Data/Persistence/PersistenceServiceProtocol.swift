//
//  PersistenceServiceProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

protocol PersistenceServiceProtocol {

    // MARK: - Favorites

    func isFavorite(characterId: Int) -> Bool

    func addFavorite(character: Character)

    func removeFavorite(characterId: Int)

    func toggleFavorite(character: Character)

    // MARK: - Watched Episodes

    func isWatched(episodeId: Int) -> Bool

    func markAsWatched(episodeId: Int)

    func unmarkAsWatched(episodeId: Int)

    func toggleWatched(episodeId: Int)
}

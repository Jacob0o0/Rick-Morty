//
//  PersistenceService.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import CoreData
import Foundation

final class PersistenceService: PersistenceServiceProtocol {
    static let shared = PersistenceService()

    private let context: NSManagedObjectContext

    private init() {
        context = PersistenceController.shared.container.viewContext
    }

    // MARK: - Favorites

    func isFavorite(characterId: Int) -> Bool {
        let request = FavoriteCharacter.fetchRequest()
        request.predicate = NSPredicate(format: "characterId == %d", characterId)
        request.fetchLimit = 1
        return (try? context.count(for: request)) ?? 0 > 0
    }

    func addFavorite(character: Character) {
        guard !isFavorite(characterId: character.id) else { return }
        let entity = FavoriteCharacter(context: context)
        entity.characterId = Int32(character.id)
        entity.name = character.name
        entity.image = character.image?.absoluteString
        entity.status = character.status.rawValue
        entity.species = character.species
        saveContext()
    }

    func removeFavorite(characterId: Int) {
        let request = FavoriteCharacter.fetchRequest()
        request.predicate = NSPredicate(format: "characterId == %d", characterId)
        guard let results = try? context.fetch(request) else { return }
        results.forEach { context.delete($0) }
        saveContext()
    }

    func toggleFavorite(character: Character) {
        if isFavorite(characterId: character.id) {
            removeFavorite(characterId: character.id)
        } else {
            addFavorite(character: character)
        }
    }

    // MARK: - Watched Episodes

    func isWatched(episodeId: Int) -> Bool {
        let request = WatchedEpisode.fetchRequest()
        request.predicate = NSPredicate(format: "episodeId == %d", episodeId)
        request.fetchLimit = 1
        return (try? context.count(for: request)) ?? 0 > 0
    }

    func markAsWatched(episodeId: Int) {
        guard !isWatched(episodeId: episodeId) else { return }
        let entity = WatchedEpisode(context: context)
        entity.episodeId = Int32(episodeId)
        saveContext()
    }

    func unmarkAsWatched(episodeId: Int) {
        let request = WatchedEpisode.fetchRequest()
        request.predicate = NSPredicate(format: "episodeId == %d", episodeId)
        guard let results = try? context.fetch(request) else { return }
        results.forEach { context.delete($0) }
        saveContext()
    }

    func toggleWatched(episodeId: Int) {
        if isWatched(episodeId: episodeId) {
            unmarkAsWatched(episodeId: episodeId)
        } else {
            markAsWatched(episodeId: episodeId)
        }
    }

    // MARK: - Private

    private func saveContext() {
        guard context.hasChanges else { return }
        try? context.save()
    }
}

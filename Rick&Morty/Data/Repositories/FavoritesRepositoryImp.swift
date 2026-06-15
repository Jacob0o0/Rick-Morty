//
//  FavoritesRepositoryImp.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import CoreData
import Foundation

final class FavoritesRepository: FavoritesRepositoryProtocol {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
    }

    func fetchAll() -> [FavoriteCharacterE] {
        let request = FavoriteCharacter.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let results = try? context.fetch(request) else { return [] }
        return results.map {
            FavoriteCharacterE(
                id: Int($0.characterId),
                name: $0.name ?? "",
                image: $0.image.flatMap { URL(string: $0) },
                status: $0.status ?? "",
                species: $0.species ?? ""
            )
        }
    }
}

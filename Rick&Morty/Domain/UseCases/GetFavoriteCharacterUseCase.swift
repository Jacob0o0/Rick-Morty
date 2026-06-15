//
//  GetFavoriteCharacterUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

protocol GetFavoriteCharactersUseCaseProtocol {
    func execute() -> [FavoriteCharacterE]
}

final class GetFavoriteCharactersUseCase: GetFavoriteCharactersUseCaseProtocol {
    private let repository: FavoritesRepositoryProtocol

    init(repository: FavoritesRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> [FavoriteCharacterE] {
        repository.fetchAll()
    }
}

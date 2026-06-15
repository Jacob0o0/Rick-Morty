//
//  FavoritesRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

protocol FavoritesRepositoryProtocol {
    func fetchAll() -> [FavoriteCharacterE]
}

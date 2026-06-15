//
//  FavoriteCharacterE.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

struct FavoriteCharacterE: Identifiable, Sendable {
    let id: Int
    let name: String
    let image: URL?
    let status: String
    let species: String
}

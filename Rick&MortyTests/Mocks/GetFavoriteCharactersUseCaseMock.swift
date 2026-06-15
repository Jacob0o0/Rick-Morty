//
//  GetFavoriteCharactersUseCaseMock.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
@testable import Rick_Morty

final class GetFavoriteCharactersUseCaseMock: GetFavoriteCharactersUseCaseProtocol {

    var favoritesToReturn: [FavoriteCharacterE] = []

    func execute() -> [FavoriteCharacterE] {
        favoritesToReturn
    }
}

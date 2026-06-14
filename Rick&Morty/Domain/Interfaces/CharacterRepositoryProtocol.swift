//
//  CharacterRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

protocol CharacterRepositoryProtocol: Sendable {
    func fetchCharacters(
        page: Int,
        name: String?,
        status: String?,
        species: String?
    ) async throws -> [Character]
    
    func fetchCharacter(id: Int) async throws -> Character
}

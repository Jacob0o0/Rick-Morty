//
//  CharacterRepositoryMock.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
@testable import Rick_Morty

final class CharacterRepositoryMock: CharacterRepositoryProtocol, @unchecked Sendable {
    
    // Variables para controlar las respuestas en los tests
    var charactersToReturn: [Character] = []
    var singleCharacterToReturn: Character?
    var shouldThrowError = false
    
    // MARK: - Implementación del Protocolo
    
    func fetchCharacters(
        page: Int,
        name: String?,
        status: String?,
        species: String?
    ) async throws -> [Character] {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: -1)
        }
        return charactersToReturn
    }
    
    func fetchCharacter(id: Int) async throws -> Character {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: -404)
        }
        
        // Si no configuramos un personaje específico en el test, lanzamos un error
        guard let character = singleCharacterToReturn else {
            throw NSError(domain: "TestError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Character not found in mock"])
        }
        
        return character
    }
}

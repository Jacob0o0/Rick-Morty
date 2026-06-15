//
//  CharacterRepositoryImpl.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

final class CharacterRepositoryImpl: CharacterRepositoryProtocol, Sendable {
    private let client: HTTPClientProtocol

    init(client: HTTPClientProtocol = HTTPClient()) {
        self.client = client
    }

    func fetchCharacters(
        page: Int,
        name: String?,
        status: String?,
        species: String?
    ) async throws -> [Character] {
        let response: CharacterResponseDTO = try await client.get(
            .characters(page: page, name: name, status: status, species: species)
        )
        return response.results.map { $0.toDomain() }
    }

    func fetchCharacter(id: Int) async throws -> Character {
        let dto: CharacterDTO = try await client.get(.character(id: id))
        return dto.toDomain()
    }
}

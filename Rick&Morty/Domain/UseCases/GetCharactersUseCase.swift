//
//  GetCharactersUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

protocol GetCharactersUseCaseProtocol: Sendable {
    func execute(page: Int, name: String?, status: String?, species: String?) async throws -> [Character]
}

final class GetCharactersUseCase: GetCharactersUseCaseProtocol {
    private let repository: CharacterRepositoryProtocol
    
    // Inyección de dependencia vía constructor
    init(repository: CharacterRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(page: Int, name: String?, status: String?, species: String?) async throws -> [Character] {
        // Lógica de negocio
        
        return try await repository.fetchCharacters(
            page: page, name: name, status: status, species: species
        )
    }
}

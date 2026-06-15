//
//  MockGetCharactersUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 14/06/26.
//

struct MockGetCharactersUseCase: GetCharactersUseCaseProtocol {
    let result: Result<[Character], Error>

    // Default para Previews — siempre exitoso
    init(result: Result<[Character], Error> = .success(Character.allMocks)) {
        self.result = result
    }

    func execute(page: Int, name: String?, status: String?, species: String?) async throws -> [Character] {
        switch result {
        case .success(let characters): return characters
        case .failure(let error):      throw error
        }
    }
}

//
//  CharacterListViewModelTests.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Testing
import XCTest
@testable import Rick_Morty

@MainActor
final class CharacterListViewModelTests: XCTestCase {
    var viewModel: CharacterListViewModel!
    var repositoryMock: CharacterRepositoryMock!

    override func setUp() {
        super.setUp()
        // Inicializamos las herramientas
        repositoryMock = CharacterRepositoryMock()
        let useCase = GetCharactersUseCase(repository: repositoryMock)
        viewModel = CharacterListViewModel(getCharactersUseCase: useCase)
    }

    func testLoadCharacters_Success() async {
        // GIVEN: El repositorio devolverá un personaje ficticio
        let mockChar = Character.mockRick // Usando mocks estáticos
        repositoryMock.charactersToReturn = [mockChar]

        // WHEN: Cargamos los personajes
        await viewModel.loadCharacters()

        // THEN: El conteo debe ser 1 y el nombre debe coincidir
        XCTAssertEqual(viewModel.characters.count, 1, "La lista debería tener un personaje")
        XCTAssertEqual(viewModel.characters.first?.name, "Rick Sanchez")
    }
}

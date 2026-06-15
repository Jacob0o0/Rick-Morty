//
//  FavoritesViewModelTests.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//


import XCTest
@testable import Rick_Morty

@MainActor
final class FavoritesViewModelTests: XCTestCase {

    private var sut: FavoritesViewModel!

    private var getFavoritesUseCaseMock: GetFavoriteCharactersUseCaseMock!
    private var persistenceServiceMock: PersistenceServiceMock!
    private var biometricServiceMock: BiometricServiceMock!

    override func setUp() {
        super.setUp()

        getFavoritesUseCaseMock = GetFavoriteCharactersUseCaseMock()
        persistenceServiceMock = PersistenceServiceMock()
        biometricServiceMock = BiometricServiceMock()

        sut = FavoritesViewModel(
            getFavoritesUseCase: getFavoritesUseCaseMock,
            persistenceService: persistenceServiceMock,
            biometricService: biometricServiceMock
        )
    }

    override func tearDown() {
        sut = nil
        getFavoritesUseCaseMock = nil
        persistenceServiceMock = nil
        biometricServiceMock = nil

        super.tearDown()
    }

    // MARK: - loadFavorites()

    func testLoadFavorites_WhenUseCaseReturnsFavorites_ShouldUpdateFavorites() {

        // GIVEN

        let favorites = [
            FavoriteCharacterE(
                id: 1,
                name: "Rick Sanchez",
                image: nil,
                status: "Alive",
                species: "Human"
            ),
            FavoriteCharacterE(
                id: 2,
                name: "Morty Smith",
                image: nil,
                status: "Alive",
                species: "Human"
            )
        ]

        getFavoritesUseCaseMock.favoritesToReturn = favorites

        // WHEN

        sut.loadFavorites()

        // THEN

        XCTAssertEqual(sut.favorites.count, 2)
        XCTAssertEqual(sut.favorites.first?.name, "Rick Sanchez")
        XCTAssertEqual(sut.favorites.last?.name, "Morty Smith")
    }

    // MARK: - filteredFavorites

    func testFilteredFavorites_WhenSearchTextIsEmpty_ShouldReturnAllFavorites() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human"),
            FavoriteCharacterE(id: 2, name: "Morty Smith", image: nil, status: "Alive", species: "Human")
        ]

        sut.searchText = ""

        // WHEN

        let result = sut.filteredFavorites

        // THEN

        XCTAssertEqual(result.count, 2)
    }

    func testFilteredFavorites_WhenSearchTextContainsWhitespaces_ShouldReturnAllFavorites() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human"),
            FavoriteCharacterE(id: 2, name: "Morty Smith", image: nil, status: "Alive", species: "Human")
        ]

        sut.searchText = "   "

        // WHEN

        let result = sut.filteredFavorites

        // THEN

        XCTAssertEqual(result.count, 2)
    }

    func testFilteredFavorites_WhenSearchTextMatchesCharacter_ShouldReturnFilteredFavorites() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human"),
            FavoriteCharacterE(id: 2, name: "Morty Smith", image: nil, status: "Alive", species: "Human")
        ]

        sut.searchText = "rick"

        // WHEN

        let result = sut.filteredFavorites

        // THEN

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.id, 1)
        XCTAssertEqual(result.first?.name, "Rick Sanchez")
    }

    func testFilteredFavorites_WhenSearchIsCaseInsensitive_ShouldReturnMatches() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human")
        ]

        sut.searchText = "RICK"

        // WHEN

        let result = sut.filteredFavorites

        // THEN

        XCTAssertEqual(result.count, 1)
    }

    func testFilteredFavorites_WhenNoCharacterMatches_ShouldReturnEmptyArray() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human")
        ]

        sut.searchText = "Summer"

        // WHEN

        let result = sut.filteredFavorites

        // THEN

        XCTAssertTrue(result.isEmpty)
    }

    // MARK: - removeFavorite()

    func testRemoveFavorite_ShouldRemoveFavoriteFromList() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human"),
            FavoriteCharacterE(id: 2, name: "Morty Smith", image: nil, status: "Alive", species: "Human")
        ]

        // WHEN

        sut.removeFavorite(id: 1)

        // THEN

        XCTAssertEqual(sut.favorites.count, 1)
        XCTAssertEqual(sut.favorites.first?.id, 2)
    }

    func testRemoveFavorite_ShouldCallPersistenceService() {

        // GIVEN

        sut.favorites = [
            FavoriteCharacterE(id: 1, name: "Rick Sanchez", image: nil, status: "Alive", species: "Human")
        ]

        // WHEN

        sut.removeFavorite(id: 1)

        // THEN

        XCTAssertEqual(
            persistenceServiceMock.removeFavoriteCalledWith,
            [1]
        )
    }
}

//
//  FavoritesViewModel.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
import Observation

@Observable
@MainActor
final class FavoritesViewModel {
    var isUnlocked = false
    var favorites: [FavoriteCharacterE] = []
    var searchText: String = ""
    var errorMessage: String?

    var filteredFavorites: [FavoriteCharacterE] {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return favorites
        }
        return favorites.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    private let getFavoritesUseCase: GetFavoriteCharactersUseCaseProtocol
    private let persistenceService: PersistenceServiceProtocol
    private let biometricService: BiometricServiceProtocol

    init(
        getFavoritesUseCase: GetFavoriteCharactersUseCaseProtocol,
        persistenceService: PersistenceServiceProtocol = PersistenceService.shared,
        biometricService: BiometricServiceProtocol
    ) {
        self.getFavoritesUseCase = getFavoritesUseCase
        self.persistenceService = persistenceService
        self.biometricService = biometricService
    }
    
    func requestAuthentication() async {

        #if DEBUG
        if ProcessInfo.processInfo.arguments.contains("UITests") {
            isUnlocked = true
            return
        }
        #endif

        guard !isUnlocked else { return }

        do {
            isUnlocked = try await biometricService.authenticate()
        } catch {
            errorMessage = "Error de autenticación"
        }
    }

    func loadFavorites() {
        favorites = getFavoritesUseCase.execute()
    }

    func removeFavorite(id: Int) {
        persistenceService.removeFavorite(characterId: id)
        favorites.removeAll { $0.id == id }
    }
}

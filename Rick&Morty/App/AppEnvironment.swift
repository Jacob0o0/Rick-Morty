//
//  AppEnvironment.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation
import SwiftUI
import Swinject

@Observable
@MainActor
final class AppEnvironment {
    let container: Container

    var characterRepository: CharacterRepositoryProtocol {
        container.resolve(CharacterRepositoryProtocol.self)!
    }
    var getCharactersUseCase: GetCharactersUseCaseProtocol {
        container.resolve(GetCharactersUseCaseProtocol.self)!
    }
    var favoritesRepository: FavoritesRepositoryProtocol {
        container.resolve(FavoritesRepositoryProtocol.self)!
    }
    var getFavoriteCharactersUseCase: GetFavoriteCharactersUseCaseProtocol {
        container.resolve(GetFavoriteCharactersUseCaseProtocol.self)!
    }
    
    var getCharacterMapPinsUseCase: GetCharacterMapPinsUseCaseProtocol {
        container.resolve(GetCharacterMapPinsUseCaseProtocol.self)!
    }

    init(container: Container) {
        self.container = container
    }

    static func bootstrap() -> AppEnvironment {
        let container = DIContainer.setup()
        return AppEnvironment(container: container)
    }

    // MARK: - ViewModel Factories

    func makeCharacterListViewModel() -> CharacterListViewModel {
        container.resolve(CharacterListViewModel.self)!
    }

    func makeCharacterDetailViewModel(character: Character) -> CharacterDetailViewModel {
        container.resolve(CharacterDetailViewModel.self, argument: character)!
    }

    func makeFavoritesViewModel() -> FavoritesViewModel {
        container.resolve(FavoritesViewModel.self)!
    }
    
    func makeMapViewModel() -> MapViewModel {
        container.resolve(MapViewModel.self)!
    }
}

// MARK: - Environment Key

private struct AppEnvironmentKey: EnvironmentKey {
    @MainActor
    static let defaultValue = AppEnvironment.bootstrap()
}

extension EnvironmentValues {
    var appEnvironment: AppEnvironment {
        get { self[AppEnvironmentKey.self] }
        set { self[AppEnvironmentKey.self] = newValue }
    }
}

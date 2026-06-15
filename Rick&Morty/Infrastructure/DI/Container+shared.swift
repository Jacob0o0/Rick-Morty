//
//  Container+shared.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Swinject
import CoreData

final class DIContainer {
    static let shared = Container()

    static func setup() -> Container {
        let container = shared

        // MARK: - Network layer
        container.register(HTTPClientProtocol.self) { _ in
            HTTPClient()
        }.inObjectScope(.container)
        
        // MARK: - Infrastructure & Services
         container.register(BiometricServiceProtocol.self) { _ in
             BiometricServiceImpl()
         }.inObjectScope(.container)

        // MARK: - CoreData
        container.register(NSManagedObjectContext.self) { _ in
            PersistenceController.shared.container.viewContext
        }.inObjectScope(.container)

        // MARK: - Data layer
        container.register(CharacterRepositoryProtocol.self) { r in
            CharacterRepositoryImpl(
                client: r.resolve(HTTPClientProtocol.self)!
            )
        }.inObjectScope(.container)

        container.register(EpisodeRepositoryProtocol.self) { r in
            EpisodeRepositoryImpl(
                client: r.resolve(HTTPClientProtocol.self)!
            )
        }.inObjectScope(.container)

        container.register(FavoritesRepositoryProtocol.self) { r in
            FavoritesRepository(
                context: r.resolve(NSManagedObjectContext.self)!
            )
        }.inObjectScope(.container)

        // MARK: - Domain layer (Use Cases)
        container.register(GetCharactersUseCaseProtocol.self) { r in
            GetCharactersUseCase(
                repository: r.resolve(CharacterRepositoryProtocol.self)!
            )
        }.inObjectScope(.container)

        container.register(GetEpisodesUseCaseProtocol.self) { r in
            GetEpisodesUseCase(
                repository: r.resolve(EpisodeRepositoryProtocol.self)!
            )
        }.inObjectScope(.container)

        container.register(GetFavoriteCharactersUseCaseProtocol.self) { r in
            GetFavoriteCharactersUseCase(
                repository: r.resolve(FavoritesRepositoryProtocol.self)!
            )
        }.inObjectScope(.container)
        
        container.register(GetCharacterMapPinsUseCaseProtocol.self) { _ in
            GetCharacterMapPinsUseCase()
        }.inObjectScope(.container)

        // MARK: - Presentation layer (ViewModels)
        container.register(CharacterListViewModel.self) { r in
            CharacterListViewModel(
                getCharactersUseCase: r.resolve(GetCharactersUseCaseProtocol.self)!
            )
        }

        container.register(CharacterDetailViewModel.self) { (r, character: Character) in
            CharacterDetailViewModel(
                character: character,
                getEpisodesUseCase: r.resolve(GetEpisodesUseCaseProtocol.self)!
            )
        }

        container.register(FavoritesViewModel.self) { r in
            FavoritesViewModel(
                getFavoritesUseCase: r.resolve(GetFavoriteCharactersUseCaseProtocol.self)!,
                biometricService: r.resolve(BiometricServiceProtocol.self)!
            )
        }.inObjectScope(.container)
        
        container.register(MapViewModel.self) { r in
            MapViewModel(
                getMapPinsUseCase: r.resolve(GetCharacterMapPinsUseCaseProtocol.self)!
            )
        }

        return container
    }
}

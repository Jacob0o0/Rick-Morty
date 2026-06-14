//
//  AppEnvironment.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation
import SwiftUI

@Observable
@MainActor
final class AppEnvironment {
    let characterRepository: CharacterRepositoryProtocol
    let getCharactersUseCase: GetCharactersUseCaseProtocol

    init(characterRepository: CharacterRepositoryProtocol) {
        self.characterRepository = characterRepository
        self.getCharactersUseCase = GetCharactersUseCase(repository: characterRepository)
    }

    static func bootstrap() -> AppEnvironment {
        AppEnvironment(characterRepository: CharacterRepositoryImpl())
    }
}

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

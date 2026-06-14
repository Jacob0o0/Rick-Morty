//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI
import CoreData

@main
struct Rick_MortyApp: App {
    @State private var environment = AppEnvironment.bootstrap()

    var body: some Scene {
        WindowGroup {
            let viewModel = CharacterListViewModel(
                getCharactersUseCase: environment.getCharactersUseCase
            )
            CharacterListView(viewModel: viewModel)
                .environment(\.appEnvironment, environment)
        }
    }
}

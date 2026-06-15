//
//  CharacterMapViewContainer.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import SwiftUI

struct CharacterMapViewContainer: View {
    @Environment(\.appEnvironment) private var environment
    @State private var listVM: CharacterListViewModel?

    var body: some View {
        Group {
            if let vm = listVM, !vm.characters.isEmpty {
                NavigationStack {
                    CharacterMapView(
                        characters: vm.characters,
                        viewModel: environment.makeMapViewModel()
                    )
                }
            } else {
                ProgressView("Cargando personajes...")
                    .task {
                        let vm = environment.makeCharacterListViewModel()
                        await vm.fetchCharactersIfNeeded()
                        listVM = vm
                    }
            }
        }
    }
}

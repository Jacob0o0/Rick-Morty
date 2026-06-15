//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI
import CoreData
import Swinject

@main
struct Rick_MortyApp: App {
    @State private var environment = AppEnvironment.bootstrap()

    var body: some Scene {
        WindowGroup {
            TabView {
                CharacterListView(
                    viewModel: environment.makeCharacterListViewModel()
                )
                .tabItem {
                    Label("Personajes", systemImage: "person.3")
                }
                .accessibilityIdentifier("charactersTab")

                FavoritesView(
                    viewModel: environment.makeFavoritesViewModel()
                )
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
                .accessibilityIdentifier("favoritesTab")
                
                CharacterMapViewContainer()
                    .tabItem { Label("Mapa", systemImage: "map") }
            }
            .environment(\.appEnvironment, environment)
        }
    }
}

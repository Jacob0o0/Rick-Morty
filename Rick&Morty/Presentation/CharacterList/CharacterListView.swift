//
//  CharacterListView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation
import SwiftUI

struct CharacterListView: View {
    @Environment(\.appEnvironment) private var env
    @State private var viewModel: CharacterListViewModel
    @State private var showFilters = false

    init(viewModel: CharacterListViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    EmptyView()

                case .loading:
                    ProgressView("Cargando personajes...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                case .empty:
                    ContentUnavailableView(
                        "Sin resultados",
                        systemImage: "person.slash",
                        description: Text("No encontramos personajes con esos filtros.")
                    )

                case .error(let message):
                    ContentUnavailableView {
                        Label("Algo salió mal", systemImage: "wifi.slash")
                    } description: {
                        Text(message)
                    } actions: {
                        Button("Reintentar") {
                            Task { await viewModel.loadCharacters(reset: true) }
                        }
                        .buttonStyle(.borderedProminent)
                    }

                case .success, .loadingMore:
                    List {
                        ForEach(viewModel.characters) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                CharacterRow(character: character)
                                    .onAppear {
                                        if character.id == viewModel.characters.last?.id {
                                            Task { await viewModel.loadCharacters() }
                                        }
                                    }
                            }
                            .accessibilityIdentifier("character_\(character.id)")
                        }

                        if viewModel.state == .loadingMore {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .listRowSeparator(.hidden)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Personajes")
            // ↓ Barra de búsqueda por nombre
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Buscar personaje..."
            )
            .onSubmit(of: .search) {
                // Se dispara cuando el usuario presiona "Buscar" en el teclado
                Task { await viewModel.applyFilters() }
            }
            .onChange(of: viewModel.searchText) { _, newValue in
                // Recarga sin filtro cuando borra el texto
                if newValue.isEmpty {
                    Task { await viewModel.applyFilters() }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showFilters = true
                    } label: {
                        Label("Filtros", systemImage: "line.3.horizontal.decrease.circle")
                            .symbolVariant(viewModel.hasActiveFilters ? .fill : .none)
                    }
                }
            }
            .sheet(isPresented: $showFilters) {
                FilterSheetView(viewModel: viewModel) {
                    Task { await viewModel.applyFilters() }
                }
            }
            .refreshable {
                await viewModel.loadCharacters(reset: true)
            }
        }
        .task {
            await viewModel.loadCharacters()
        }
    }
}

#Preview {
    CharacterListView(
        viewModel: CharacterListViewModel(
            getCharactersUseCase: MockGetCharactersUseCase()
        )
    )
}

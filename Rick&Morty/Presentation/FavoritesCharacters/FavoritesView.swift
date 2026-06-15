//
//  FavoritesView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import SwiftUI

struct FavoritesView: View {
    @State private var viewModel: FavoritesViewModel

    init(viewModel: FavoritesViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isUnlocked {
                    if viewModel.favorites.isEmpty {
                        emptyStateView
                    } else {
                        favoritesList
                    }
                } else {
                    VStack(spacing: 20) {
                        Image(systemName: "faceid").font(.system(size: 60))
                        Text("Favoritos Protegidos")
                        Button("Desbloquear") {
                            Task { await viewModel.requestAuthentication() }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
            }
            .navigationTitle("Favoritos")
            .searchable(
                text: $viewModel.searchText,
                prompt: "Buscar favorito..."
            )
            .task {
                await viewModel.requestAuthentication()
            }
        }
        .onAppear {
            viewModel.loadFavorites()
        }
    }

    // MARK: - Subviews

    private var favoritesList: some View {
        List {
            ForEach(viewModel.filteredFavorites) { character in
                FavoriteCharacterRowView(character: character)
                    .accessibilityElement(children: .contain)
                    .accessibilityIdentifier("favorite_\(character.id)")
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            }
            .onDelete { indexSet in
                indexSet.forEach { index in
                    let character = viewModel.filteredFavorites[index]
                    viewModel.removeFavorite(id: character.id)
                }
            }
        }
        .listStyle(.plain)
        .animation(.easeInOut, value: viewModel.filteredFavorites.map(\.id))
        .accessibilityIdentifier("favoritesList")
    }

    private var emptyStateView: some View {
        VStack(spacing: 16) {
            Image(systemName: "heart.slash")
                .font(.system(size: 60))
                .foregroundStyle(.gray.opacity(0.5))
            Text("Sin favoritos")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text("Agrega personajes a favoritos\ndesde su detalle.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


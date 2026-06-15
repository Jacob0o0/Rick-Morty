//
//  CharacterListViewModel.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation
import Observation

enum CharacterListState: Equatable {
    case idle
    case loading
    case loadingMore
    case success
    case empty
    case error(String)

    static func == (lhs: CharacterListState, rhs: CharacterListState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading),
             (.loadingMore, .loadingMore), (.success, .success),
             (.empty, .empty): return true
        case (.error(let a), .error(let b)): return a == b
        default: return false
        }
    }
}

@Observable
@MainActor
final class CharacterListViewModel {
    var characters: [Character] = []
    var state: CharacterListState = .idle

    var searchText: String = ""
    var searchSpecies: String = ""
    var selectedStatus: CharacterStatus? = nil

    var hasActiveFilters: Bool {
        selectedStatus != nil
    }

    // Para el scroll infinito
    var isLoadingMore: Bool {
        state == .loadingMore
    }

    private var currentPage: Int = 1
    private var canLoadMore: Bool = true
    private let getCharactersUseCase: GetCharactersUseCaseProtocol

    init(getCharactersUseCase: GetCharactersUseCaseProtocol) {
        self.getCharactersUseCase = getCharactersUseCase
    }

    func loadCharacters(reset: Bool = false) async {
        if reset {
            currentPage = 1
            characters = []
            canLoadMore = true
        }

        // Evita llamadas duplicadas
        guard canLoadMore,
              state != .loading,
              state != .loadingMore else { return }

        state = characters.isEmpty ? .loading : .loadingMore

        do {
            let newCharacters = try await getCharactersUseCase.execute(
                page: currentPage,
                name: searchText.isEmpty ? nil : searchText,
                status: selectedStatus?.rawValue,
                species: searchSpecies.isEmpty ? nil : searchSpecies
            )

            if newCharacters.isEmpty {
                canLoadMore = false
                
                state = characters.isEmpty ? .empty : .success
            } else {
                characters.append(contentsOf: newCharacters)
                currentPage += 1
                state = .success
            }
        } catch ResponseError.notFound {
            // La API no encontró resultados (estado vacío)
            canLoadMore = false
            state = characters.isEmpty ? .empty : .success

        } catch {
            // Error real de red u otro inesperado
            state = characters.isEmpty
                ? .error("No se pudieron cargar los personajes.")
                : .success
        }
    }

    func applyFilters() async {
        await loadCharacters(reset: true)
    }
    
    func fetchCharactersIfNeeded() async {
        guard characters.isEmpty else { return }
        await loadCharacters()
    }
}

//
//  GetEpisodesUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

protocol GetEpisodesUseCaseProtocol: Sendable {
    func execute(urls: [URL]) async throws -> [Episode]
}

final class GetEpisodesUseCase: GetEpisodesUseCaseProtocol{
    private let repository: EpisodeRepositoryProtocol
    
    init(repository: EpisodeRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(urls: [URL]) async throws -> [Episode] {
        // Lógica de negocio
        
        return try await repository.fetchEpisodes(
            from: urls
        )
    }
}

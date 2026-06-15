//
//  EpisodeRepositoryImpl.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

final class EpisodeRepositoryImpl: EpisodeRepositoryProtocol, Sendable {
    private let client: HTTPClientProtocol

    init(client: HTTPClientProtocol = HTTPClient()) {
        self.client = client
    }
    
    func fetchEpisodes(from urls: [URL]) async throws -> [Episode] {
        let ids = urls.compactMap { url -> Int? in
            guard let lastSegment = url.pathComponents.last else { return nil }
            return Int(lastSegment)
        }
        
        return try await withThrowingTaskGroup(of: Episode.self) { group in
            for id in ids {
                group.addTask {
                    let dto: EpisodeDTO = try await self.client.get(.episode(id: id))
                    return dto.toDomain()
                }
            }

            var episodes: [Episode] = []
            for try await episode in group {
                episodes.append(episode)
            }
            // Ordena por ID para mantener el orden original
            return episodes.sorted { $0.id < $1.id }
        }
    }
}

//
//  EpisodeRepositoryProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

protocol EpisodeRepositoryProtocol {
    func fetchEpisodes(from urls: [URL]) async throws -> [Episode]
}

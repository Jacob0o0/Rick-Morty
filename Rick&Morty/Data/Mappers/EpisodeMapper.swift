//
//  EpisodeMapper.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

extension EpisodeDTO {
    func toDomain() -> Episode {
        return Episode(
            id: self.id,
            name: self.name,
            airDate: self.airDate,
            episodeCode: self.episodeCode,
            characterURLs: self.characters,
            url: self.url,
            created: self.created
        )
    }
}

//
//  EpisodeDTO.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

struct EpisodeDTO: Decodable {
    let id: Int
    let name: String
    let airDate: String
    let episodeCode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name, url, created, characters
        case airDate     = "air_date"
        case episodeCode = "episode"
    }
}

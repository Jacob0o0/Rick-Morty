//
//  CharacterMapper.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

extension CharacterDTO {
    func toDomain() -> Character {
        return Character(
            id: self.id,
            name: self.name,
            status: CharacterStatus(rawValue: self.status) ?? .unknown,
            species: self.species,
            type: self.type,
            gender: CharacterGender(rawValue: self.gender) ?? .unknown,
            origin: LocationReference(
                name: self.origin.name,
                url: self.origin.url
            ),
            location: LocationReference(
                name: self.location.name,
                url: self.location.url
            ),
            image: URL(string: self.image),
            episode: self.episode,
            url: self.url?.absoluteString ?? "",
            created: self.created
        )
    }
}


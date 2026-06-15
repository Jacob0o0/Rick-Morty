//
//  GetCharacterMapPinUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

protocol GetCharacterMapPinsUseCaseProtocol {
    func execute(characters: [Character]) -> [CharacterMapPin]
}

final class GetCharacterMapPinsUseCase: GetCharacterMapPinsUseCaseProtocol {
    func execute(characters: [Character]) -> [CharacterMapPin] {
        characters.map { character in
            CharacterMapPin(
                id: character.id,
                name: character.name,
                image: character.image,
                status: character.status,
                locationName: character.location.name,
                coordinate: CoordinateSimulatorService.coordinate(
                    for: character.location.url
                )
            )
        }
    }
}

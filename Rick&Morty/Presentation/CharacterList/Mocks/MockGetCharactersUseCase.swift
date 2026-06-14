//
//  MockGetCharactersUseCase.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

// MARK: - Datos reutilizables
extension LocationReference {
    static let earth = LocationReference(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1")
    static let citadel = LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3")
    static let unknown = LocationReference(name: "unknown", url: "")
}

extension Character {
    static let mockRick = Character(
        id: 1,
        name: "Rick Sanchez",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        origin: .earth,
        location: .citadel,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/1"],
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )

    static let mockMorty = Character(
        id: 2,
        name: "Morty Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        origin: .earth,
        location: .earth,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/1"],
        url: "https://rickandmortyapi.com/api/character/2",
        created: "2017-11-04T18:50:21.651Z"
    )

    static let mockSummer = Character(
        id: 3,
        name: "Summer Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .female,
        origin: .earth,
        location: .earth,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/3",
        created: "2017-11-04T19:09:56.428Z"
    )

    static let mockBeth = Character(
        id: 4,
        name: "Beth Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .female,
        origin: .earth,
        location: .earth,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/4",
        created: "2017-11-04T19:22:43.665Z"
    )

    static let mockJerry = Character(
        id: 5,
        name: "Jerry Smith",
        status: .alive,
        species: "Human",
        type: "",
        gender: .male,
        origin: .earth,
        location: .earth,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/6"],
        url: "https://rickandmortyapi.com/api/character/5",
        created: "2017-11-04T19:26:56.301Z"
    )

    static let mockEvilMorty = Character(
        id: 6,
        name: "Evil Morty",
        status: .unknown,
        species: "Human",
        type: "",
        gender: .male,
        origin: .unknown,
        location: .citadel,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/361.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10"],
        url: "https://rickandmortyapi.com/api/character/361",
        created: "2018-01-10T18:20:41.703Z"
    )

    static let mockAbadango = Character(
        id: 7,
        name: "Abadango Cluster Princess",
        status: .alive,
        species: "Alien",
        type: "",
        gender: .female,
        origin: LocationReference(name: "Abadango", url: "https://rickandmortyapi.com/api/location/2"),
        location: LocationReference(name: "Abadango", url: "https://rickandmortyapi.com/api/location/2"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/27"],
        url: "https://rickandmortyapi.com/api/character/7",
        created: "2017-11-04T19:50:28.250Z"
    )

    static let mockDeadCharacter = Character(
        id: 8,
        name: "Bepisian",
        status: .dead,
        species: "Alien",
        type: "Bepisian",
        gender: .unknown,
        origin: LocationReference(name: "Bepis 9", url: "https://rickandmortyapi.com/api/location/5"),
        location: .unknown,
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/18.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10"],
        url: "https://rickandmortyapi.com/api/character/18",
        created: "2017-11-04T20:13:12.171Z"
    )

    static let allMocks: [Character] = [
        .mockRick, .mockMorty, .mockSummer, .mockBeth,
        .mockJerry, .mockEvilMorty, .mockAbadango, .mockDeadCharacter
    ]
}

// MARK: - Mock UseCase
struct MockGetCharactersUseCase: GetCharactersUseCaseProtocol {
    func execute(page: Int, name: String?, status: String?, species: String?) async throws -> [Character] {
        return Character.allMocks
    }
}

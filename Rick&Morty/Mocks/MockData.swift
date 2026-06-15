//
//  MockData.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

extension Character {
    static let mockRick = Character(
        id: 1, name: "Rick Sanchez", status: .alive, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"),
        episode: (1...51).map { "https://rickandmortyapi.com/api/episode/\($0)" },
        url: "https://rickandmortyapi.com/api/character/1",
        created: "2017-11-04T18:48:46.250Z"
    )

    static let mockMorty = Character(
        id: 2, name: "Morty Smith", status: .alive, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"),
        episode: (1...51).map { "https://rickandmortyapi.com/api/episode/\($0)" },
        url: "https://rickandmortyapi.com/api/character/2",
        created: "2017-11-04T18:50:21.651Z"
    )

    static let mockSummer = Character(
        id: 3, name: "Summer Smith", status: .alive, species: "Human", type: "",
        gender: .female,
        origin: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/3.jpeg"),
        episode: [6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49,51].map { "https://rickandmortyapi.com/api/episode/\($0)" },
        url: "https://rickandmortyapi.com/api/character/3",
        created: "2017-11-04T19:09:56.428Z"
    )

    static let mockBeth = Character(
        id: 4, name: "Beth Smith", status: .alive, species: "Human", type: "",
        gender: .female,
        origin: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/4.jpeg"),
        episode: [6,7,8,9,10,11,12,14,15,16,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49,51].map { "https://rickandmortyapi.com/api/episode/\($0)" },
        url: "https://rickandmortyapi.com/api/character/4",
        created: "2017-11-04T19:22:43.665Z"
    )

    static let mockJerry = Character(
        id: 5, name: "Jerry Smith", status: .alive, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/5.jpeg"),
        episode: [6,7,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,26,29,30,31,32,33,35,36,38,39,40,41,42,43,44,45,46,47,48,49,50,51].map { "https://rickandmortyapi.com/api/episode/\($0)" },
        url: "https://rickandmortyapi.com/api/character/5",
        created: "2017-11-04T19:26:56.301Z"
    )

    static let mockAbadango = Character(
        id: 6, name: "Abadango Cluster Princess", status: .alive, species: "Alien", type: "",
        gender: .female,
        origin: LocationReference(name: "Abadango", url: "https://rickandmortyapi.com/api/location/2"),
        location: LocationReference(name: "Abadango", url: "https://rickandmortyapi.com/api/location/2"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/6.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/27"],
        url: "https://rickandmortyapi.com/api/character/6",
        created: "2017-11-04T19:50:28.250Z"
    )

    static let mockAbradolf = Character(
        id: 7, name: "Abradolf Lincler", status: .unknown, species: "Human", type: "Genetic experiment",
        gender: .male,
        origin: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        location: LocationReference(name: "Testicle Monster Dimension", url: "https://rickandmortyapi.com/api/location/21"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/7.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/11"],
        url: "https://rickandmortyapi.com/api/character/7",
        created: "2017-11-04T19:59:20.523Z"
    )

    static let mockAdjudicatorRick = Character(
        id: 8, name: "Adjudicator Rick", status: .dead, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/8.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/28"],
        url: "https://rickandmortyapi.com/api/character/8",
        created: "2017-11-04T20:03:34.737Z"
    )

    static let mockAgencyDirector = Character(
        id: 9, name: "Agency Director", status: .dead, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/9.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/24"],
        url: "https://rickandmortyapi.com/api/character/9",
        created: "2017-11-04T20:06:54.976Z"
    )

    static let mockAlanRails = Character(
        id: 10, name: "Alan Rails", status: .dead, species: "Human", type: "Superhuman (Ghost trains summoner)",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Worldender's lair", url: "https://rickandmortyapi.com/api/location/4"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/10.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/25"],
        url: "https://rickandmortyapi.com/api/character/10",
        created: "2017-11-04T20:19:09.017Z"
    )

    static let mockAlbertEinstein = Character(
        id: 11, name: "Albert Einstein", status: .dead, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/11.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/12"],
        url: "https://rickandmortyapi.com/api/character/11",
        created: "2017-11-04T20:20:20.965Z"
    )

    static let mockAlexander = Character(
        id: 12, name: "Alexander", status: .dead, species: "Human", type: "",
        gender: .male,
        origin: LocationReference(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: LocationReference(name: "Anatomy Park", url: "https://rickandmortyapi.com/api/location/5"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/12.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/3"],
        url: "https://rickandmortyapi.com/api/character/12",
        created: "2017-11-04T20:32:33.144Z"
    )

    static let mockAlienGoogah = Character(
        id: 13, name: "Alien Googah", status: .unknown, species: "Alien", type: "",
        gender: .unknown,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/13.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/31"],
        url: "https://rickandmortyapi.com/api/character/13",
        created: "2017-11-04T20:33:30.779Z"
    )

    static let mockAlienMorty = Character(
        id: 14, name: "Alien Morty", status: .unknown, species: "Alien", type: "",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/14.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10"],
        url: "https://rickandmortyapi.com/api/character/14",
        created: "2017-11-04T20:51:31.373Z"
    )

    static let mockAlienRick = Character(
        id: 15, name: "Alien Rick", status: .unknown, species: "Alien", type: "",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/15.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10"],
        url: "https://rickandmortyapi.com/api/character/15",
        created: "2017-11-04T20:56:13.215Z"
    )

    static let mockAmishCyborg = Character(
        id: 16, name: "Amish Cyborg", status: .dead, species: "Alien", type: "Parasite",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Earth (Replacement Dimension)", url: "https://rickandmortyapi.com/api/location/20"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/16.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/15"],
        url: "https://rickandmortyapi.com/api/character/16",
        created: "2017-11-04T21:12:45.235Z"
    )

    static let mockAnnie = Character(
        id: 17, name: "Annie", status: .alive, species: "Human", type: "",
        gender: .female,
        origin: LocationReference(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
        location: LocationReference(name: "Anatomy Park", url: "https://rickandmortyapi.com/api/location/5"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/17.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/3"],
        url: "https://rickandmortyapi.com/api/character/17",
        created: "2017-11-04T22:21:24.481Z"
    )

    static let mockAntennaMorty = Character(
        id: 18, name: "Antenna Morty", status: .alive, species: "Human", type: "Human with antennae",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/18.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10", "https://rickandmortyapi.com/api/episode/28"],
        url: "https://rickandmortyapi.com/api/character/18",
        created: "2017-11-04T22:25:29.008Z"
    )

    static let mockAntennaRick = Character(
        id: 19, name: "Antenna Rick", status: .unknown, species: "Human", type: "Human with antennae",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "unknown", url: ""),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/19.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/10"],
        url: "https://rickandmortyapi.com/api/character/19",
        created: "2017-11-04T22:28:13.756Z"
    )

    static let mockAntsInMyEyesJohnson = Character(
        id: 20, name: "Ants in my Eyes Johnson", status: .unknown, species: "Human",
        type: "Human with ants in his eyes",
        gender: .male,
        origin: LocationReference(name: "unknown", url: ""),
        location: LocationReference(name: "Interdimensional Cable", url: "https://rickandmortyapi.com/api/location/6"),
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/20.jpeg"),
        episode: ["https://rickandmortyapi.com/api/episode/8"],
        url: "https://rickandmortyapi.com/api/character/20",
        created: "2017-11-04T22:34:53.659Z"
    )

    static let allMocks: [Character] = [
        .mockRick, .mockMorty, .mockSummer, .mockBeth, .mockJerry,
        .mockAbadango, .mockAbradolf, .mockAdjudicatorRick, .mockAgencyDirector,
        .mockAlanRails, .mockAlbertEinstein, .mockAlexander, .mockAlienGoogah,
        .mockAlienMorty, .mockAlienRick, .mockAmishCyborg, .mockAnnie,
        .mockAntennaMorty, .mockAntennaRick, .mockAntsInMyEyesJohnson
    ]
}

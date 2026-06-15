//
//  Character.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

struct Character: Identifiable, Sendable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let origin: LocationReference
    let location: LocationReference
    let image: URL?
    let episode: [String]
    let url: String
    let created: String
}

enum CharacterStatus: String, Sendable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "Unknown"
}

enum CharacterGender: String, Sendable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct LocationReference: Sendable {
    let name: String
    let url: String
}

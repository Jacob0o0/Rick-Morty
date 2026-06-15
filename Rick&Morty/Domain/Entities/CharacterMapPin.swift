//
//  CharacterMapPin.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

struct CharacterMapPin: Identifiable, Sendable {
    let id: Int
    let name: String
    let image: URL?
    let status: CharacterStatus
    let locationName: String
    let coordinate: LocationCoordinate
}

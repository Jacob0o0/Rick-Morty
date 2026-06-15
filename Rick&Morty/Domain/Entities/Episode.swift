//
//  Episode.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

struct Episode: Identifiable, Sendable {
    let id: Int
    let name: String
    let airDate: String
    let episodeCode: String
    let characterURLs: [String]
    let url: String
    let created: String
    
    var season: Int? {
        guard let match = episodeCode.range(of: #"S(\d+)"#, options: .regularExpression) else { return nil }
        return Int(episodeCode[match].dropFirst())
    }
    
    var episodeNumber: Int? {
        guard let match = episodeCode.range(of: #"E(\d+)"#, options: .regularExpression) else { return nil }
        return Int(episodeCode[match].dropFirst())
    }
}

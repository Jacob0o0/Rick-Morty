//
//  APIEndpoint.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

enum APIEndpoint {
    static let baseURL = "https://rickandmortyapi.com/api"

    case characters(page: Int, name: String?, status: String?, species: String?)
    case character(id: Int)
    case episode(id: Int)
    case location(id: Int)

    var url: URL {
        switch self {
        case .characters(let page, let name, let status, let species):
            var components = URLComponents(string: "\(APIEndpoint.baseURL)/character")!
            var queryItems = [URLQueryItem(name: "page", value: "\(page)")]
            if let name    = name    { queryItems.append(URLQueryItem(name: "name",    value: name))    }
            if let status  = status  { queryItems.append(URLQueryItem(name: "status",  value: status))  }
            if let species = species { queryItems.append(URLQueryItem(name: "species", value: species)) }
            components.queryItems = queryItems
            return components.url!
            
        case .character(let id):
            return URL(string: "\(APIEndpoint.baseURL)/character/\(id)")!

        case .episode(let id):
            return URL(string: "\(APIEndpoint.baseURL)/episode/\(id)")!

        case .location(let id):
            return URL(string: "\(APIEndpoint.baseURL)/location/\(id)")!
        }
        
    }
}

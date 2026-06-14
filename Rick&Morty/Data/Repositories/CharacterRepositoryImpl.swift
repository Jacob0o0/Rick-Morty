//
//  CharacterRepositoryImpl.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

enum CharacterError: Error {
    case notFound
    case network
    case unknown
}

final class CharacterRepositoryImpl: CharacterRepositoryProtocol, Sendable {
    // URL base de la API
    private let baseURL = "https://rickandmortyapi.com/api"
    
    private let session: URLSession = .shared
    
    func fetchCharacters(
        page: Int,
        name: String?,
        status: String?,
        species: String?
    ) async throws -> [Character] {
        // URL con parámetros
        var components = URLComponents(string: "\(baseURL)/character")!
        var queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        
        if let name = name { queryItems.append(URLQueryItem(name: "name", value: name)) }
        if let status = status { queryItems.append(URLQueryItem(name: "status", value: status)) }
        if let species = species { queryItems.append(URLQueryItem(name: "species", value: species)) }
        
        components.queryItems = queryItems
        
        guard let url = components.url else { throw URLError(.badURL) }
        
        print(url)

        // Petición de red
        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CharacterError.network
        }

        switch httpResponse.statusCode {
        case 200:
            let responseDTO = try JSONDecoder().decode(CharacterResponseDTO.self, from: data)
            return responseDTO.results.map { $0.toDomain() }
        case 404:
            throw CharacterError.notFound  // ← sin resultados, no es error de red
        default:
            throw CharacterError.network
        }
    }
    
    func fetchCharacter(id: Int) async throws -> Character {
        guard let url = URL(string: "\(baseURL)/character/\(id)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await session.data(from: url)
        
        // Decodificando directamente el DTO
        let dto = try JSONDecoder().decode(CharacterDTO.self, from: data)
        
        return dto.toDomain()
    }
}

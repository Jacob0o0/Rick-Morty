//
//  HTTPClientProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import Foundation

enum ResponseError: Error {
    case notFound
    case network
    case unknown
}

// Protocolo para poder mockearlo en tests
protocol HTTPClientProtocol: Sendable {
    func get<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T
}

final class HTTPClient: HTTPClientProtocol, Sendable {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get<T: Decodable>(_ endpoint: APIEndpoint) async throws -> T {
        let url = endpoint.url

        let (data, response) = try await session.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw ResponseError.network
        }

        switch httpResponse.statusCode {
        case 200:
            return try JSONDecoder().decode(T.self, from: data)
        case 404:
            throw ResponseError.notFound
        default:
            throw ResponseError.network
        }
    }
}

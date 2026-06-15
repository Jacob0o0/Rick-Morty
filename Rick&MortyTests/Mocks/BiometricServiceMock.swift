//
//  BiometricServiceMock.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
@testable import Rick_Morty

enum MockError: Error {
    case authenticationFailed
}

final class BiometricServiceMock: BiometricServiceProtocol {

    var shouldAuthenticate = true
    var error: Error?

    func authenticate() async throws -> Bool {

        if let error {
            throw error
        }

        return shouldAuthenticate
    }
}

//
//  BiometricServiceProtocol.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

protocol BiometricServiceProtocol {
    func authenticate() async throws -> Bool
}

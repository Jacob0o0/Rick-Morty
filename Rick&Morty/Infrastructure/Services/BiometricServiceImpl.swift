//
//  BiometricServiceImpl.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import LocalAuthentication

final class BiometricServiceImpl: BiometricServiceProtocol {
    func authenticate() async throws -> Bool {
        let context = LAContext()
        var error: NSError?
        
        guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            throw error ?? NSError(domain: "Biometrics", code: -1)
        }
        
        return try await context.evaluatePolicy(
            .deviceOwnerAuthenticationWithBiometrics,
            localizedReason: "Identifícate para ver tus favoritos"
        )
    }
}

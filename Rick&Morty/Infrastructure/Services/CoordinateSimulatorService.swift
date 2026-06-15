//
//  CoordinateSimulatorService.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation

struct CoordinateSimulatorService {

    // Ciudades reales como "anclas" para que los pins se distribuyan
    // en lugares reconocibles del mundo
    private static let anchors: [(lat: Double, lon: Double)] = [
        (40.7128,  -74.0060),  // New York
        (51.5074,   -0.1278),  // London
        (35.6762,  139.6503),  // Tokyo
        (-33.8688, 151.2093),  // Sydney
        (48.8566,    2.3522),  // Paris
        (55.7558,   37.6176),  // Moscow
        (-22.9068,  -43.1729), // Rio de Janeiro
        (19.4326,  -99.1332),  // Mexico City
        (28.6139,   77.2090),  // New Delhi
        (-1.2921,   36.8219),  // Nairobi
        (37.7749, -122.4194),  // San Francisco
        (41.9028,   12.4964),  // Rome
        (1.3521,   103.8198),  // Singapore
        (30.0444,   31.2357),  // Cairo
        (-34.6037,  -58.3816), // Buenos Aires
    ]

    static func coordinate(for locationURL: String) -> LocationCoordinate {
        // Extrae el ID numérico del URL de la locación
        let locationId = extractId(from: locationURL)

        // Ancla base según el ID
        let anchor = anchors[locationId % anchors.count]

        // Offset pseudoaleatorio pero determinista usando el ID
        // Spread de ±8 grados alrededor del ancla
        let seed = Double(locationId)
        let latOffset = sin(seed * 1.3) * 8.0
        let lonOffset = cos(seed * 1.7) * 8.0

        return LocationCoordinate(
            latitude:  anchor.lat + latOffset,
            longitude: anchor.lon + lonOffset
        )
    }

    private static func extractId(from url: String) -> Int {
        // "https://rickandmortyapi.com/api/location/20" → 20
        Int(url.components(separatedBy: "/").last ?? "0") ?? 0
    }
}

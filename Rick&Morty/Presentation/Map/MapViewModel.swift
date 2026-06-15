//
//  MapViewModel.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import Foundation
import MapKit
import Observation
import SwiftUI

@Observable
@MainActor
final class MapViewModel {
    var pins: [CharacterMapPin] = []
    var selectedPin: CharacterMapPin? = nil
    var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20.0, longitude: 0.0),
        span: MKCoordinateSpan(latitudeDelta: 120, longitudeDelta: 120)
    )

    private let getMapPinsUseCase: GetCharacterMapPinsUseCaseProtocol

    init(getMapPinsUseCase: GetCharacterMapPinsUseCaseProtocol) {
        self.getMapPinsUseCase = getMapPinsUseCase
    }

    func loadPins(from characters: [Character]) {
        pins = getMapPinsUseCase.execute(characters: characters)
    }

    func selectPin(_ pin: CharacterMapPin) {
        selectedPin = pin
        withAnimation {
            mapRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: pin.coordinate.latitude,
                    longitude: pin.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
            )
        }
    }

    func clearSelection() {
        selectedPin = nil
    }
}

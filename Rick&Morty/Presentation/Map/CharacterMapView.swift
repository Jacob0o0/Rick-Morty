//
//  CharacterMapView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 15/06/26.
//

import SwiftUI
import MapKit

struct CharacterMapView: View {
    @State private var viewModel: MapViewModel
    let characters: [Character]

    init(characters: [Character], viewModel: MapViewModel) {
        self.characters = characters
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.pins) { pin in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: pin.coordinate.latitude,
                        longitude: pin.coordinate.longitude
                    )
                ) {
                    MapPinView(
                        pin: pin,
                        isSelected: viewModel.selectedPin?.id == pin.id
                    )
                    .onTapGesture {
                        viewModel.selectPin(pin)
                    }
                }
            }
            .ignoresSafeArea()

            if let selected = viewModel.selectedPin {
                CharacterMapCardView(pin: selected) {
                    viewModel.clearSelection()
                }
                .padding()
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .animation(.spring(response: 0.4), value: viewModel.selectedPin?.id)
            }
        }
        .navigationTitle("Mapa de Personajes")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadPins(from: characters)
        }
    }
}

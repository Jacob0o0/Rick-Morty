//
//  FilterSheetView.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI

struct FilterSheetView: View {
    @Bindable var viewModel: CharacterListViewModel
    @Environment(\.dismiss) private var dismiss
    let onApply: () -> Void

    var body: some View {
        NavigationStack {
            Form {
                // Filtro por especie
                Section("Filtrar por Especie") {
                    TextField("Especie (ej. Alien)", text: $viewModel.searchSpecies)
                        .onSubmit {
                            Task { await viewModel.loadCharacters(reset: true) }
                        }
                }
                
                // Filtro por status
                Section("Estado") { 
                    ForEach([CharacterStatus.alive, .dead, .unknown], id: \.self) { status in
                        Button {
                            viewModel.selectedStatus = viewModel.selectedStatus == status ? nil : status
                        } label: {
                            HStack {
                                Text(status.rawValue)
                                    .foregroundStyle(.primary)
                                Spacer()
                                if viewModel.selectedStatus == status {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.blue)
                                }
                            }
                        }
                    }
                }

                // Limpiar filtros
                if viewModel.hasActiveFilters {
                    Section {
                        Button("Limpiar filtros", role: .destructive) {
                            viewModel.selectedStatus = nil
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Filtros")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Aplicar") {
                        onApply()
                        dismiss()
                    }
                    .bold()
                }
            }
        }
    }
}

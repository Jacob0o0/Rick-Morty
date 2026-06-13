//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Jacobo Escorcia on 13/06/26.
//

import SwiftUI
import CoreData

@main
struct Rick_MortyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

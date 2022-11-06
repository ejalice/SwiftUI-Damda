//
//  DamdaApp.swift
//  Damda
//
//  Created by eunji on 2022/11/07.
//

import SwiftUI

@main
struct DamdaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

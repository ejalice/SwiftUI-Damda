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
            DetailView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .preferredColorScheme(.dark)
        }
    }
}

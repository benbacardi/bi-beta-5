//
//  Bricking_ItApp.swift
//  Shared
//
//  Created by Ben Cardy on 19/08/2020.
//

import SwiftUI

@main
struct Bricking_ItApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Main()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

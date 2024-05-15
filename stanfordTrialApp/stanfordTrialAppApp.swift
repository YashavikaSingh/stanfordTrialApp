//
//  stanfordTrialAppApp.swift
//  stanfordTrialApp
//
//  Created by Yashavika Singh on 12.05.24.
//

import SwiftUI

@main
struct stanfordTrialAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

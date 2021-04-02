//
//  Day60ChallengeJSONApp.swift
//  Day60ChallengeJSON
//
//  Created by Musab Aljarba on 20/08/1442 AH.
//

import SwiftUI

@main
struct Day60ChallengeJSONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

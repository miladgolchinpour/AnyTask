//
//  AnyTaskApp.swift
//  Shared
//
//  Created by Milad Golchinpour on 8/4/21.
//  Copyright © 2021 Milad Golchinpour. All rights reserved.
//

import SwiftUI

@main
struct AnyTaskApp: App {
    let persistanceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistanceController.container.viewContext)
                .environmentObject(Settings())
        }
    }
}

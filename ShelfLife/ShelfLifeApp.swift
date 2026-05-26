//
//  ShelfLifeApp.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

@main
struct ShelfLifeApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Grocery.self)
    }
}

//
//  ContentView.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Groceries", systemImage: "carrot.fill"){
                FilteredGroceryList()
            }
            Tab("Categories", systemImage: "tray.full.fill"){
                CategoriesView()
            }
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Grocery.self, inMemory: true)
}

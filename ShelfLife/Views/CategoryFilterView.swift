//
//  CategoryFilterView.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct CategoryFilterView: View {
    @State var activeCategory: Categories

    @Query(sort: \Grocery.expirationDate) var groceries: [Grocery]
    
    var filtered: [Grocery] {
        groceries.filter{$0.category == activeCategory}
    }
    
    var body: some View {
        NavigationStack{
            Group {
                if(!filtered.isEmpty) {
                    List(filtered){ grocery in
                        GroceryCard(grocery: grocery)
                    }
                } else {
                    ContentUnavailableView("No Grocery in this Category", systemImage: "carrot.fill")
                }
            }
           
            .navigationTitle(Text("\(activeCategory.name.capitalized)"))
            
        }
                
    }
}

#Preview {
    CategoryFilterView(activeCategory: Categories.fruits)
        .modelContainer(for: Grocery.self, inMemory: true)
}

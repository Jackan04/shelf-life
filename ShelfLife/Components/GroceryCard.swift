//
//  GroceryCard.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct GroceryCard: View {
    @State var grocery: Grocery
    
    var body: some View {
        NavigationLink(destination: GroceryDetailView(grocery: grocery)) {
            VStack(alignment: .leading, spacing: 4) {
                HStack{
                    Text(grocery.name)
                        .font(.headline)
                }
                
                Text(grocery.category.name)
                    .foregroundStyle(grocery.category.color)
                    .font(.caption)
                
                if(grocery.isExpired){
                    Text("Expired On \(grocery.expirationDate, style: .date)")
                        .font(.caption.bold())
                        .foregroundStyle(.red)
                    
                } else {
                    Text("Expires \(grocery.expirationDate, style: .date)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            
        }
    }
}

#Preview {
    let item = Grocery(
        name: "Bananas",
        expirationDate: Date(),
        notes: "Yum Yum",
        category: Categories.fruits
    )
    
    GroceryCard(grocery: item)
        .modelContainer(for: Grocery.self, inMemory: true)
        
}

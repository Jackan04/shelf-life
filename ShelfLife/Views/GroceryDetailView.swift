//
//  GroceryDetails.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI

struct GroceryDetailView: View {
    @State var grocery: Grocery
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name"){
                    TextField("Name", text: $grocery.name)
                }
                
                Section("Dates"){
                    if(!grocery.isExpired){
                        DatePicker("Expiration Date", selection: $grocery.expirationDate, displayedComponents: .date)
                    } else{
                        DatePicker("Expired On", selection: $grocery.expirationDate, displayedComponents: .date)
                            .disabled(true)
                            .foregroundStyle(Color.red)
                    }
                  
                    DatePicker(
                        "Added",
                        selection: $grocery.createdAt,
                        displayedComponents: .date
                    )
                    .disabled(true)
                }
                
                Section("Category"){
                    Picker("Category", selection: $grocery.category){
                        ForEach(Categories.allCases){category in
                            Text(category.name).tag(category)
                        }
                    }
                }
                
                Section("Notes"){
                    TextEditor(text: $grocery.notes)
                        .frame(height: 100)
                }
                
                .navigationTitle("Grocery Details")
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
    
    GroceryDetailView(grocery: item)
}

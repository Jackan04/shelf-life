//
//  GroceryList.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct GroceryList: View {
    @Query var groceries: [Grocery]
    
    @Environment(\.modelContext) private var context
    
    
    @State private var isShowingSheet: Bool = false
    
    init(nameFilter: String = "") {
        let predicate = #Predicate<Grocery> { grocery in
            nameFilter.isEmpty || grocery.name
                .localizedStandardContains(nameFilter)
        }
        _groceries = Query(filter: predicate, sort: \Grocery.name)
    }
    
    var expiresSoon: [Grocery] {
        groceries.filter { $0.expiresWithin7Days }
    }
    
    var expired: [Grocery] {
        groceries.filter{$0.isExpired}
    }
  
    
    var body: some View {
        NavigationStack() {
            if(groceries.isEmpty){
                ContentUnavailableView("Add Grocery", systemImage: "carrot.fill")
            }
            
            List {
                if !groceries.isEmpty {
                    if(!expired.isEmpty){
                        Section("Expired") {
                            ForEach(expired) { grocery in
                                GroceryCard(grocery: grocery)
                            }
                            .onDelete(perform: deleteGrocery)
                        }
                    }
                    
                    if !expiresSoon.isEmpty {
                        Section("Expires Soon") {
                            ForEach(expiresSoon) { grocery in
                                GroceryCard(grocery: grocery)
                            }
                            .onDelete(perform: deleteGrocery)
                        }
                    }
                    
                    if(!groceries.isEmpty){
                        Section("All Groceries") {
                            ForEach(groceries) { grocery in
                                GroceryCard(grocery: grocery)
                            }
                            .onDelete(perform: deleteGrocery)
                        }
                    }
               
                }
              

                
                 
                

               
            }
            .navigationTitle("My Groceries")
            
            .toolbar {
                Button("New", systemImage: "plus"){
                    isShowingSheet = true
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
            }
            .sheet(isPresented: $isShowingSheet) {
                AddGroceryView()
            }
        }
    }
    
    private func deleteGrocery(indexes: IndexSet){
        for index in indexes{
            context.delete(groceries[index])
        }
    }
    }
    

#Preview {
    GroceryList()
        .modelContainer(for: Grocery.self, inMemory: true)
}

#Preview("Empty State") {
    GroceryList()
}


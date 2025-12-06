//
//  AddGroceryView.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct AddGroceryView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var grocery: Grocery = Grocery(
        name: "",
        expirationDate: Date(),
        notes: "",
        category: Categories.none
    )
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Grocery Name"){
                    TextField("Enter name", text: $grocery.name)
                }
                
                Section("Expiration Date"){
                    DatePicker("Expiration Date", selection: $grocery.expirationDate, displayedComponents: .date)
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
            }
            
            .navigationTitle("New Grocery")
                .navigationBarTitleDisplayMode(.inline)
            
                .toolbar {
                   ToolbarItem(placement: .cancellationAction) {
                       Button("Cancel", systemImage: "") {
                        dismiss()
                        resetForm()
                    }
                   }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save", systemImage: "checkmark") {
                            addGrocery()
                            dismiss()
                            resetForm()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                    }
                }
        }
       

    }
    
    private func addGrocery(){
        if(!grocery.name.isEmpty){
            context.insert(grocery)
        }
    }
    
    private func resetForm(){
        grocery = Grocery(
            name: "",
            expirationDate: Date(),
            notes: "",
            category: .none
        )
    }
}

#Preview {
    AddGroceryView()
        .modelContainer(for: Grocery.self, inMemory: true)
}

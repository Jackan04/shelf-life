//
//  FilteredGroceryList.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI
import SwiftData

struct FilteredGroceryList: View {
    @State private var searchText: String = ""
    var body: some View {
        GroceryList(nameFilter: searchText)
            .searchable(text: $searchText)
    }
}

#Preview {
    FilteredGroceryList()
        .modelContainer(for: Grocery.self)
}

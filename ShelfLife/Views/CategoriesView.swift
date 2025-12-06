//
//  CategoriesView.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationStack{
            List{
                ForEach(Categories.allCases){category in
                    NavigationLink(
                        destination: CategoryFilterView(
                            activeCategory: category
                        )
                    ){
                        HStack(spacing: 14){
                            Circle()
                                .frame(width: 14, height: 14)
                                .foregroundStyle(category.color)
                            Text(category.name)
                            
                           
                        }
                    }
                  
                        
                }
            }
            .navigationTitle(Text("Categories"))
        }
       
    }
}

#Preview {
    CategoriesView()
}

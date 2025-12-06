//
//  Categories.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import Foundation
import SwiftUI

enum Categories: String, CaseIterable, Codable, Identifiable {
    var id: String { rawValue }
    
    case none, fruits, vegetables, dairy, meat, snacks, beverages, pantry, frozen
    
    var name: String {
        switch self {
            case .none: return "No Category"
            case .fruits: return "Fruits"
            case .vegetables: return "Vegetables"
            case .dairy: return "Dairy"
            case .meat: return "Meat & Seafood"
            case .snacks: return "Snacks"
            case .beverages: return "Beverages"
            case .pantry: return "Dry Goods"
            case .frozen: return "Frozen"
        }

    }
    
    var color: Color {
        switch self{
            case .none: return .gray
            case .fruits: return .red
            case .vegetables: return .green
            case .dairy: return .yellow
            case .meat: return .blue
            case .snacks: return .orange
            case .beverages: return .purple
            case .pantry: return .brown
            case .frozen: return .cyan
        }
    }
}

//
//  Grocery.swift
//  ShelfLife
//
//  Created by Jacob Asker on 2025-11-27.
//

import Foundation
import SwiftData

@Model
class Grocery {
    var name: String
    var expirationDate: Date
    var notes: String
    var category: Categories
    var createdAt: Date
    
    init(
        name: String,
        expirationDate: Date,
        notes: String,
        category: Categories
    ){
        self.name = name
        self.expirationDate = expirationDate
        self.notes = notes
        self.category = category
        self.createdAt = Date()
    }
    
    var expiresWithin7Days: Bool {
       guard let cutoff = Calendar.current.date(byAdding: .day, value: 7, to: Date()) else { return false }
       return expirationDate >= Date() && expirationDate <= cutoff
        
    }
    
    var expiresToday: Bool {
        return Calendar.current.isDate(expirationDate, inSameDayAs: Date())
    }
    
    var isExpired: Bool {
        return Date() > expirationDate
    }
}

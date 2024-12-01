//
//  Item.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

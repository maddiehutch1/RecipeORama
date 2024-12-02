//
//  Ingredient.swift
//  RecipeApp2024
//
//  Created by IS 543 on 12/2/24.
//

import Foundation
import SwiftData

@Model
final class Ingredient {
    var name: String
    var quantity: Float
    var measurement: String
    var descriptionInfo: String?
    var notes: String?
    
    init(name: String, quantity: Float, measurement: String, description: String? = nil, notes: String? = nil) {
        self.name = name
        self.quantity = quantity
        self.measurement = measurement
        self.descriptionInfo = description
    }

}

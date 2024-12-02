//
//  Recipe.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import Foundation
import SwiftData

@Model
final class Recipe {
    var title: String
    var ingredients: String
    var instructions: String
    
    init(title: String, ingredients: String, instructions: String) {
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
    }
}

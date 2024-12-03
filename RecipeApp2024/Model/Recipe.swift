//
//  Recipe.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import Foundation
import SwiftData

@Model
final class Recipe: Identifiable {
    var title: String = ""
    var ingredients: String  = ""
    var instructions: String = ""
    var author: String = ""
    var date: Date = Date()
    var servings: String = ""
    var tags: String  = ""// tell user to insert "," so you can divide it up
    var difficultyLevel: String = ""
    var isFavorite: Bool = false
    
    init(title: String = "", ingredients: String = "", instructions: String = "", author: String = "", date: Date = Date(), servings: String = "", tags: String = "", difficultyLevel: String = "", isFavorite: Bool = false) {
        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.author = author
        self.date = date
        self.servings = servings
        self.tags = tags
        self.difficultyLevel = difficultyLevel
        self.isFavorite = isFavorite
    }
}


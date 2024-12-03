//
//  EditRecipeSheet.swift
//  RecipeApp2024
//
//  Created by IS 543 on 12/2/24.
//

import SwiftUI

struct EditRecipeSheet: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var showSheet: Bool
    
    @State private var recipe: Recipe
    
    init(recipe: Recipe, showSheet: Binding<Bool>) {
            _recipe = State(initialValue: recipe)
            _showSheet = showSheet
        }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Recipe Title", text: $recipe.title)
                    TextField("Author", text: $recipe.author)
                    Toggle("Is Favorite", isOn: $recipe.isFavorite)
                    DatePicker("Date", selection: $recipe.date, displayedComponents: .date)
                    TextField("Serving Amount", text: $recipe.servings)
                    TextField("Difficulty Level", text: $recipe.difficultyLevel)
                    TextField("Ingredients", text: $recipe.ingredients)
                    TextField("Instructions", text: $recipe.instructions)
                }
            }
            .navigationTitle("Edit Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        editRecipe()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func editRecipe() {
        withAnimation {
            //modelContext.update(recipe)
        }
    }
    
    private func dismiss() {
        showSheet.toggle()
    }
    
}

#Preview {
    EditRecipeSheet(recipe: .init(), showSheet: .constant(true))
}

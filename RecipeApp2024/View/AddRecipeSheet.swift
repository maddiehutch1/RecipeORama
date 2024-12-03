//
//  AddRecipeSheet.swift
//  RecipeApp2024
//
//  Created by IS 543 on 12/2/24.
//

import SwiftUI

struct AddRecipeSheet: View {
    @Environment(\.modelContext) private var modelContext
    @State private var newRecipe = Recipe()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Recipe Title", text: $newRecipe.title)
                    TextField("Author", text: $newRecipe.author)
                    Toggle("Is Favorite", isOn: $newRecipe.isFavorite)
                    DatePicker("Date", selection: $newRecipe.date, displayedComponents: .date)
                    TextField("Serving Amount", text: $newRecipe.servings)
                    TextField("Difficulty Level", text: $newRecipe.difficultyLevel)
                    TextField("Ingredients", text: $newRecipe.ingredients)
                    TextField("Instructions", text: $newRecipe.instructions)
                    
                    
                    //            Picker("Category", selection: $selectedCategory) {
                    //                Text("Select a category").tag(nil as AnimalCategory?)
                    //                ForEach(categories) { category in
                    //                    Text(category.name).tag(category as AnimalCategory?)
                    //                }
                    //            }
                }
            }
            .navigationTitle("Add Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        //dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        addRecipe()
                        //dismiss()
                    }
                }
            }
        }
    }
    
    private func addRecipe() {
        withAnimation {
            modelContext.insert(newRecipe)
        }
    }
    
}



#Preview {
    AddRecipeSheet()
}

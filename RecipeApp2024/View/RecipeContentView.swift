//
//  RecipeContentView.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct RecipeContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    @Query(filter: #Predicate<Recipe> { $0.isFavorite }) private var favoriteRecipes: [Recipe]

    @State public var showSheet = false
    @State private var searchString: String = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink {
                    recipesList(for: recipes)
                } label: {
                    Text("Browse all recipes")
                }
                
                NavigationLink {
                    recipesList(for: favoriteRecipes)
                } label: {
                    Text("Show favorites")
                }
            }
            
        } content: {
            recipesList(for: recipes)
        } detail: {
            Text("Select a recipe")
        }
    }

    // computed properties
    private func recipesList(for recipes: [Recipe]) -> some View {
        List {
            ForEach(recipes) { recipe in
                NavigationLink {
                    Markdown("# \(recipe.title)")
                    Markdown(recipe.author)
                    Markdown(recipe.difficultyLevel)
                    Markdown(recipe.ingredients)
                    Markdown(recipe.instructions)
                } label: {
                    Markdown(recipe.title)
                }
            }
            .onDelete(perform: deleteItems)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: { showSheet = true }) {
                    Label("Add Recipe", systemImage: "plus")
                }
            }
        }
        .searchable(text: $searchString)
        .sheet(isPresented: $showSheet) { // Attach the sheet modifier here
            AddRecipeSheet(showSheet: $showSheet)
        }
    }

    
//    private func addItem() {
//        withAnimation {
//            let newItem = Recipe(title: "stuff", ingredients: "stuff", instructions: "stuff", author: "stuff", date: Date(), servings: "stuff", tags: "stuff", difficultyLevel: "stuff", isFavorite: true)
//            modelContext.insert(newItem)
//        }
//    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(recipes[index])
            }
        }
    }

}

#Preview {
    RecipeContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}

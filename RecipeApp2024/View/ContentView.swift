//
//  ContentView.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import SwiftUI
import SwiftData
import MarkdownUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]

    @State private var searchString: String = ""
    
    var body: some View {
        NavigationSplitView {
            NavigationLink {
                Markdown("Browse all recipes")
                Markdown("Show favorites")
                Markdown("Item three")
            } label: {
                
            }
        } content: {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        Markdown("Recipe at \(recipe.title)")
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
                    Button(action: addItem) {
                        Label("Add Recipe", systemImage: "plus")
                    }
                }
            }
            .searchable(text: $searchString)
        } detail: {
            Text("Select a recipe")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Recipe(title: "Mac N Cheese", ingredients: "cheese, noodles, milk", instructions: "check this stuff out! Super tasty. yummy.")
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(recipes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}

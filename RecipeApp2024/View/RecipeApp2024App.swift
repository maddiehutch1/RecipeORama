//
//  RecipeApp2024App.swift
//  RecipeApp2024
//
//  Created by Madison Hutchings on 11/14/24.
//

import SwiftUI
import SwiftData

@main
struct RecipeApp2024App: App {
    let container: ModelContainer
   // let viewModel: RecipeViewModel

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container) // have persistent items in my model container
       // .environment(viewModel)
    }
    
    init() {
        do {
            container = try ModelContainer(for: Recipe.self)
        } catch {
            fatalError("""
                Failed to create ModelContainer for Recipe. 
                If you made a change to the Model, uninstall 
                app and restart it from Xcode
                """)
        }
        
       // viewModel = RecipeViewModel()
    }
}

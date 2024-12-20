//
//  ContentView.swift
//  appChuckNorris
//
//  Created by jimbo on 17/12/24.
//

import SwiftUI
import SwiftUI

struct ContentView: View {
    
    @State private var categories: [String] = []
    
    @State private var joke: String = ""
    
    @State private var selectedCategory: String?
    private let chuckNorrisService = ChuckNorrisService()
    
    var body: some View {
        NavigationView {
            VStack {
                if let selectedCategory = selectedCategory {
                    Text("Categoría: \(selectedCategory)")
                        .font(.title)
                        
                    
                    Button("Dato") {
                        if selectedCategory != nil { // Verificar si selectedCategory tiene un valor no nulo
                            fetchJokeForCategory(category: selectedCategory)
                        } else {
                            joke = "Selecciona una categoría."
                        }
                    }
                    .padding()
                    .font(.headline)
                    
                }
                
                Text(joke)
                    .font(.body)
                    .padding()
                    .foregroundColor(.black)
                
                Spacer()
                
                // Mostrar las categorías disponibles
                List(categories, id: \.self) { category in
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        Text(category)
                    }
                }
                .colorInvert()
                .onAppear {
                    fetchCategories()
                
                }
            }
            .navigationTitle("Datos de Chuck Norris")
            
            
        }
    }
    
    private func fetchCategories() {
        chuckNorrisService.fetchCategories { categories in
            if let categories = categories {
                DispatchQueue.main.async {
                    self.categories = categories
                }
            }
        }
    }
    
    private func fetchJokeForCategory(category: String) {
        chuckNorrisService.fetchJokeByCategory(category: category) { joke in
            if let joke = joke {
                DispatchQueue.main.async {
                    self.joke = joke
                }
            } else {
                DispatchQueue.main.async {
                    self.joke = "No se pudo obtener el chiste."
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


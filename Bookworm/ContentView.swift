//
//  ContentView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 06.12.2025.
//

import SwiftData
import SwiftUI

//test


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    @State private var showingAddScreen: Bool = false

    var body: some View {
        
        NavigationStack {
            Text("Count is \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement:.topBarTrailing) {
                        Button("Add book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                    
                }.sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}


#Preview {
    ContentView()
}

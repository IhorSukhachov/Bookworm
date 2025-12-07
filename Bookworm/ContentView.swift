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
            List {
                ForEach(books) {book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline )
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                          
                        }
                    }
                }
            }
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

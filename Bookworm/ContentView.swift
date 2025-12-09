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
    @Query(sort: [
        SortDescriptor(\Book.title, order: .reverse),
        SortDescriptor(\Book.author)
    ]) var books: [Book]

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
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                          
                        }
                    }
                }.onDelete(perform:  deleteBooks)
            }
                .navigationTitle("Bookworm")
                .navigationDestination(for: Book.self) {book in
                    DetailView(book: book)
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
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
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
             let book = books[offset]
            modelContext.delete(book)
        }
    }
}


#Preview {
    ContentView()
}

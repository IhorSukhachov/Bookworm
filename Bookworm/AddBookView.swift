//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 07.12.2025.
//
import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = "Fantasy"
    @State private var review: String = ""
    @State private var rating: Int = 3
    
    let genres: [String] = ["Fantasy", "Science Fiction", "Romance", "Mystery", "Horror"]
    
    var body: some View {
        NavigationStack {
             Form {
                 Section {
                     TextField("Name of book", text: $title)
                     TextField("Author's name", text: $author)
                     
                     Picker("Genre", selection: $genre) {
                         ForEach(genres, id: \.self) {
                             Text($0)
                         }
                     }
                 }
                 Section("Write a review") {
                     TextEditor(text: $review)
                     
                     Picker("Rating", selection: $rating) {
                         ForEach(0..<6) {
                              Text(String($0))
                         }
                     }
                 }
                 
                 Section {
                     Button("Save") {
                         let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                         modelContext.insert(newBook)
                     }
                 }
             }.navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

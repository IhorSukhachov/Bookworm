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
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var author: String = ""
    @State private var genre: String = "Fantasy"
    @State private var review: String = ""
    @State private var rating: Int = 3
     
    let genres: [String] = ["Fantasy", "Horror", "Romance", "Kids", "Mystery", "Poetry", "Thriller"]
    
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
                     RatingView(rating: $rating)
                 }
                 
                 Section {
                     Button("Save") {
                         let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                         modelContext.insert(newBook)
                         dismiss()
                     }
                 }
             }.navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}

//
//  DetailView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 08.12.2025.
//
import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: "Test genre", review: "some review", rating: 3)
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create book preview: \(error.localizedDescription)")
    }
   
}

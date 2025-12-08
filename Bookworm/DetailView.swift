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
        ScrollView {
            ZStack(alignment: .bottomTrailing)  {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(Color.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize )
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

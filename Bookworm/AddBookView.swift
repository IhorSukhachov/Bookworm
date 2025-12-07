//
//  AddBookView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 07.12.2025.
//

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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AddBookView()
}

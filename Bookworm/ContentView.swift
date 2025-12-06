//
//  ContentView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 06.12.2025.
//
import SwiftData
import SwiftUI



struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]
    
    var body: some View {
        NavigationStack {
             List(students) { student in
                 Text(student.name)
                }
             .navigationTitle("Students")
             .toolbar {
                 Button("Add") {
                     let firstNames = ["Ginny", "Ron", "Harry", "Hermiona "]
                     let lastNames = ["Weasley", "Riddle ", "Potter", "Granger"]
                     let chosenFirstName = firstNames.randomElement()!
                     let chosenLastName = lastNames.randomElement()!
                     
                     let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                     modelContext.insert(student)
                 }
             }
            }
        }
    }
    
 

#Preview {
    ContentView()
}

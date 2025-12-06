//
//  ContentView.swift
//  Bookworm
//
//  Created by Ihor Sukhachov on 06.12.2025.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @State var isOm: Bool
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    
    var body: some View {
        Button(title) {
            isOm.toggle()
        }
        .padding()
        .background(LinearGradient (colors: isOm ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOm ? 0 : 5)
    }
}

struct ContentView: View {
    
    @State private var rememberMe = false

    var body: some View {
        VStack {
            Toggle("Remember me", isOn: $rememberMe)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
    // Project: FriendsFavoriteMovies1
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Friends", systemImage: "person.and.person"){
                FriendList()
            }
            Tab("Movies", systemImage: "film.stack"){
                MovieList()
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}

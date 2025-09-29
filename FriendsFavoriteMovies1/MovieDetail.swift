//
    // Project: FriendsFavoriteMovies1
    //  File: MovieDetail.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct MovieDetail: View {
    @Bindable var movie: Movie
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    let isNew: Bool
    
    init(movie: Movie, isNew: Bool = false) {
        self.movie = movie
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Movie", text: $movie.title)
           
            DatePicker("Release date", selection: $movie.releaseDate, displayedComponents: .date)
        }
        .navigationTitle(isNew ? "New Movie" :"Movie")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if isNew{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        context.delete(movie)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie)
    }
}

#Preview{
    NavigationStack {
        MovieDetail(movie: SampleData.shared.movie, isNew: true)
    }
}

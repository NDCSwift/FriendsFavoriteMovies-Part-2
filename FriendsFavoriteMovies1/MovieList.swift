//
    // Project: FriendsFavoriteMovies1
    //  File: MovieList.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SwiftData

struct MovieList: View {
    @Query(sort: \Movie.title) private var movies: [Movie]
    @Environment(\.modelContext) private var context
    @State private var newMovie: Movie?
    var body: some View {
        NavigationSplitView {
            List{
                ForEach(movies) { movie in
                    NavigationLink(movie.title){
                        MovieDetail(movie: movie)
                        
                        Text("Detail view for \(movie.title)")
                    }
                }
                .onDelete(perform: deleteMovies(indexes:))
            }
            .navigationTitle("Movies")
            .toolbar{
                
                ToolbarItem{
                    Button("Add movie", systemImage: "plus", action: addMovie)
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
            .sheet(item: $newMovie){ movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a movie")
               
        }
    }
    private func addMovie() {
        let newMovie = Movie(title: "", releaseDate: .now)
        context.insert(newMovie)
        self.newMovie = newMovie
    }
    
    private func deleteMovies(indexes: IndexSet){
        for index in indexes {
            context.delete(movies[index])
        }
    }
}

#Preview {
    MovieList()
        .modelContainer(SampleData.shared.modelContainer)
}

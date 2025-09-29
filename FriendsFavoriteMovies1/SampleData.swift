//
    // Project: FriendsFavoriteMovies1
    //  File: SampleData.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import Foundation
import SwiftData

@MainActor
class SampleData{
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext{
        modelContainer.mainContext
    }
    
    var friend: Friend{
        Friend.sampleData.first!
    }
    var movie: Movie{
        Movie.sampleData.first!
    }
    
    private init(){
        let schema = Schema([
            Friend.self,
            Movie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do{  modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
            try context.save()
        } catch{
            fatalError("Could not create modelContainer: \(error)")
        }
    }
    
    private func insertSampleData(){
        for friend in Friend.sampleData{
            context.insert(friend)
        }
        for movie in Movie.sampleData{
            context.insert(movie)
        }
    }
    
}




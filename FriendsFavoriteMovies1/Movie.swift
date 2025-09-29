//
    // Project: FriendsFavoriteMovies1
    //  File: Movie.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import Foundation
import SwiftData

@Model
class Movie{
    var title: String
    var releaseDate: Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
    static let sampleData = [
        Movie(title: "Amusing Space Traveler 3", releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
        Movie(title: "Difficult Cat", releaseDate: Calendar.current.date(from: DateComponents(year:2024, month: 10, day: 1)) ?? Date()),
        Movie(title: "Electrifying Trek",
              releaseDate: Date(timeIntervalSinceReferenceDate: 300_000_000)),
        Movie(title: "Reckless Train Ride 2",
              releaseDate: Date(timeIntervalSinceReferenceDate: 120_000_000)),
        Movie(title: "The Last Venture",
              releaseDate: Date(timeIntervalSinceReferenceDate: 550_000_000)),
        Movie(title: "Glamorous Neighbor",
              releaseDate: Date(timeIntervalSinceReferenceDate: -1_700_000_000)),
        
    ]
    
}

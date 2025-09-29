//
    // Project: FriendsFavoriteMovies1
    //  File: FriendDetail.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI

struct FriendDetail: View {
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        
        
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
        }
        Text("Detail View for \(friend.name)")
            .navigationTitle(isNew ? "New Friend" : "Friend")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if isNew {
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save"){
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel"){
                            context.delete(friend)
                            dismiss()
                            
                        }
                    }
                }
            }
    }
}

#Preview {
    
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
    }
}

#Preview("New Friend"){
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
    }
}

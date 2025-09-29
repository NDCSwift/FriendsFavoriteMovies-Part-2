//
    // Project: FriendsFavoriteMovies1
    //  File: FriendList.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SwiftData

struct FriendList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var newFriend: Friend?
    var body: some View {
        NavigationSplitView {
            List{
                ForEach(friends) { friend in
                    NavigationLink(friend.name){
                        FriendDetail(friend: friend)
                   
                    }
                    
                }
                .onDelete(perform: deleteFriends(indexes:))
            }
            .navigationTitle("Friends")
            .toolbar {
                ToolbarItem{
                    Button("Add friend", systemImage: "plus", action: addFriend)
                }
                ToolbarItem(placement: .topBarTrailing){
                    EditButton()
                }
            }
            .sheet(item: $newFriend){ friend in
                NavigationStack {
                    FriendDetail(friend: friend, isNew: true)
                }
                .interactiveDismissDisabled()
            }
        } detail: {
            Text("Select a friend")
                .navigationTitle("Friend")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func addFriend(){
        let newFriend = Friend(name: "")
        context.insert(newFriend)
        self.newFriend = newFriend
    }
    
    private func deleteFriends(indexes: IndexSet){
        for index in indexes {
            context.delete(friends[index])
        }
    }
    
}

#Preview {
    FriendList()
        .modelContainer(SampleData.shared.modelContainer)
}

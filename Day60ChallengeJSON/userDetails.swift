//
//  userDetails.swift
//  Day60ChallengeJSON
//
//  Created by Musab Aljarba on 20/08/1442 AH.
//

import SwiftUI

struct userDetails: View {
    let user: User
    @ObservedObject var fetchedUsers = UsersFetching()
    
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Name: \(user.name)")
                
                Text(user.about)
                    .padding()
                
                Text("Email: \(user.email)")
                
                Text("Company: \(user.company)")
                
                Text("Age: \(user.age)")
                
                Text("Friends:")
                    .padding()
                
                ForEach(getFriends()) { user in
                    NavigationLink(
                        destination: userDetails(user: user),
                        label: {
                            Text(user.name)
                        })
                
                }
                
                
            }
        }
    }
    
    func getFriends() -> [User] {
        var matches = [User]()
        
        for friend in self.user.friends {
            for user in fetchedUsers.users {
                if friend.id == user.id {
                    matches.append(user)
                }
            }
        }
        return matches
    }
    
}

//struct userDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        userDetails(user: User())
//    }
//}

//
//  FetchingUsers.swift
//  Day60ChallengeJSON
//
//  Created by Musab Aljarba on 20/08/1442 AH.
//

import Foundation

class UsersFetching: ObservableObject {
    @Published var users = [User]()
    
    init() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                   print("Invalid URL")
                   return
               }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decodedUsers = try? JSONDecoder().decode([User].self, from: data) {
                DispatchQueue.main.async {
                    self.users = decodedUsers
                }
                return
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        } .resume()
    }
}

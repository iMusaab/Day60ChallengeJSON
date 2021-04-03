//
//  User.swift
//  Day60ChallengeJSON
//
//  Created by Musab Aljarba on 20/08/1442 AH.
//

import Foundation


struct User: Codable, Identifiable {
    
    struct friend: Codable, Identifiable {
        let id: String
        let name: String
    }
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [friend]
    
    var friendsText: String {
        var names = ""
        
        for friend in friends {
            names += friend.name + "\n"
        }
        return String(names.dropLast())
    }
}

//
//  Profile.swift
//  SCC2
//
//  Created by Hoeun Lee on 11/10/23.
//

import SwiftUI
import Foundation

struct Profile: Identifiable, Hashable {
    var id: UUID
    var name: String
    var groupName: String
    var description: String
    var profileImageLink: String
    var email: String
    
    init(name: String, groupName: String, description: String, profileImageLink: String, email: String) {
        self.id = UUID()
        self.name = name
        self.groupName = groupName
        self.description = description
        self.profileImageLink = profileImageLink
        self.email = email
    }
}

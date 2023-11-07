//
//  User.swift
//  Final
//
//  Created by zumin you on 2023/11/05.
//

import Foundation

struct Info: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    var id: Int
    var firstName, lastName, maidenName: String
    var age: Int
    var email, phone, username, password: String
    var birthDate: String
    var image: String
    var bloodGroup: String
    var height: Int
    var weight: Double
    
    init(id: Int = 0, firstName: String = "", lastName: String = "", maidenName: String = "", age: Int = 0, email: String = "", phone: String = "", username: String = "", password: String = "", birthDate: String = "", image: String = "", bloodGroup: String = "", height: Int = 0, weight: Double = 0.0) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.maidenName = maidenName
        self.age = age
        self.email = email
        self.phone = phone
        self.username = username
        self.password = password
        self.birthDate = birthDate
        self.image = image
        self.bloodGroup = bloodGroup
        self.height = height
        self.weight = weight
    }
}

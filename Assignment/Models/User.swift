//
//  User.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import Foundation

class User : Codable {
    var id: String?
    var blogID: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var lastname: String?
    var city: String?
    var designation: String?
    var about: String?
    
    enum CodingKeys: String, CodingKey {
       case id = "id"
       case blogID = "blogID"
       case createdAt = "createdAt"
       case name = "name"
       case avatar = "avatar"
       case lastname = "lastname"
       case city = "city"
       case designation = "designation"
       case about = "about"
    }
}

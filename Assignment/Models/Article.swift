//
//  MediaResponse.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import Foundation

class Article : Codable {
    var id: String?
    var createdAt: String?
    var content: String?
    var comments: Int?
    var likes: Int?
    var media: [Media]?
    var user: [User]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case createdAt = "createdAt"
        case content = "content"
        case comments = "comments"
        case likes = "likes"
        case media = "media"
        case user = "user"
    }
}

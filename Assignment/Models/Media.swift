//
//  Media.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import Foundation

class Media : Codable {
    var id: String?
    var blogID: String?
    var createdAt: String?
    var image: String?
    var title: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
           case id = "id"
           case blogID = "blogID"
           case createdAt = "createdAt"
           case image = "image"
           case title = "title"
           case url = "url"
        }
}

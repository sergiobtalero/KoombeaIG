//
//  PostEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

struct PostEntity: DataEntity {
    let uid, name, email: String
    let profilePic: String
    let post: PostDetailEntity

    enum CodingKeys: String, CodingKey {
        case uid, name, email
        case profilePic = "profile_pic"
        case post
    }
    
    func toDomain() throws -> Post {
        Post(uid: uid,
             name: name,
             email: email,
             profilePic: profilePic,
             post: try? post.toDomain())
    }
}

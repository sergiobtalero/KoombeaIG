//
//  Post.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public struct Post {
    public let uid, name, email: String
    public let profilePic: String
    public let post: PostDetail?
    
    public init(uid: String,
                name: String,
                email: String,
                profilePic: String,
                post: PostDetail?) {
        self.uid = uid
        self.name = name
        self.email = email
        self.profilePic = profilePic
        self.post = post
    }
}

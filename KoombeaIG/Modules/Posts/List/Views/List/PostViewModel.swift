//
//  PostViewModel.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Foundation
import Domain

struct PostViewModel: Identifiable {
    let id = UUID()
    let headerViewModel: PostHeaderViewModel
    let imagesURLs: [URL]
    
    init(post: Post) {
        headerViewModel = PostHeaderViewModel(userProfileImageURL: URL(string: post.profilePic),
                                              userName: post.name,
                                              userEmail: post.email,
                                              postDate: post.post?.date)
        imagesURLs = post.post?.pics ?? []
    }
}

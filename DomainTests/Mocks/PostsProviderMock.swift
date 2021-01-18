//
//  PostsProviderMock.swift
//  DomainTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

final class PostsProviderMock: PostsProviderContract {
    let posts: [Post]?
    
    init(posts: [Post]?) {
        self.posts = posts
    }
    
    func getPostsList(urlSession: URLSession = URLSession.shared,
                      completion: @escaping ([Post]?) -> Void) {
        completion(posts)
    }
}

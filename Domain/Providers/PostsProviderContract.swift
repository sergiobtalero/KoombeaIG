//
//  PostsProviderContract.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public enum PostsProviderError: Error {
    case generic
    case savingFailed
}

public protocol PostsProviderContract {
    func getPostsList(urlSession: URLSession, completion: @escaping(_: [Post]?) -> Void)
    func getCachedPostsList() throws -> [Post]?
    func savePostToCache(_ post: Post) throws
    func savePosts(_ posts: [Post]) throws
}

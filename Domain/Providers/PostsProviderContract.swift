//
//  PostsProviderContract.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public enum PostsProviderError: Error {
    case generic
}

public protocol PostsProviderContract {
    func getPostsList(urlSession: URLSession, completion: @escaping(_: [Post]?) -> Void)
}

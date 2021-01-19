//
//  GetPostsListUseCase.swift
//  Domain
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public protocol GetPostsListUseCaseContract {
    func execute(completion: @escaping (_: [Post]?) -> Void)
}

public enum GetPostsListUseCaseError: Error {
    case generic
}

public final class GetPostsListUseCase {
    private let provider: PostsProviderContract
    
    public init(provider: PostsProviderContract) {
        self.provider = provider
    }
}

extension GetPostsListUseCase: GetPostsListUseCaseContract {
    public func execute(completion: @escaping (_: [Post]?) -> Void) {
        if let entities = try? provider.getCachedPostsList() {
            completion(entities)
            return
        }
        provider.getPostsList(urlSession: URLSession.shared) { [weak self] posts in
            posts.map { try? self?.provider.savePosts($0) }
            completion(posts)
        }
    }
}

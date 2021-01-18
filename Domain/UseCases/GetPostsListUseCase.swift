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
        provider.getPostsList(urlSession: URLSession.shared, completion: completion)
    }
}

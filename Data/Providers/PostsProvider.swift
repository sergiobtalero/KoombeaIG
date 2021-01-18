//
//  PostsProvider.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

public final class PostsProvider {
    public init() {}
}

typealias GetPostsListResponse = Result<RawServerResponse<PostEntity>?, Error>

extension PostsProvider: PostsProviderContract {
    public func getPostsList(urlSession: URLSession = URLSession.shared,
                             completion: @escaping ([Post]?) -> Void) {
        PostsService.list.execute(session: urlSession) { (result: GetPostsListResponse) in
            if case let .success(response) = result,
               let entities = response?.data {
                let models = entities.compactMap { try? $0.toDomain() }
                completion(models)
            } else {
                completion(nil)
            }
        }
    }
}

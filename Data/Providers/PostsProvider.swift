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

// MARK: - PostsProviderContract
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
    
    public func getCachedPostsList() throws -> [Post]? {
        do {
            if let entities = try CachedPostsService().getSavedPosts() {
               return try entities.toDomain()
            }
            throw PostsProviderError.generic
        } catch {
            throw PostsProviderError.generic
        }
    }
    
    public func savePostToCache(_ post: Post) throws {
        guard let entity = PostReverseMapper.map(from: post) else {
            return
        }
        do {
            try CachedPostsService().savePostEntity(entity)
        } catch {
            throw PostsProviderError.savingFailed
        }
    }
    
    public func savePosts(_ posts: [Post]) throws {
        for post in posts {
            do {
                try savePostToCache(post)
            } catch {
                throw PostsProviderError.savingFailed
            }
        }
    }
}

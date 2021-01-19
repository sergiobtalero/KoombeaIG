//
//  CachedPostsService.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import CouchbaseLiteSwift
import Foundation

enum CachedPostsServiceError: Error {
    case missingDB
    case saveFailed
    case documentsNotFound
}

final class CachedPostsService {
    private enum Constant {
        static let dbName = "KoombeaIG"
        static let post = "Post"
    }
    
    let database: Database
    
    init() {
        do {
            Database.log.console.level = .none
            Database.log.console.domains = .query
            database = try Database(name: Constant.dbName)
        } catch {
            fatalError("Error opening database")
        }
    }
    
    func savePostEntity(_ postEntity: PostEntity) throws {
        guard let dictionary = try? postEntity.asDictionary() else {
            throw CachedPostsServiceError.missingDB
        }
        let object = MutableDictionaryObject(data: dictionary)
        let document = MutableDocument()
            .setDictionary(object, forKey: "dictionary")
            .setString(Constant.post, forKey: "type")
        
        do {
            try database.saveDocument(document)
        } catch {
            throw CachedPostsServiceError.saveFailed
        }
    }
    
    func getSavedPosts() throws -> [PostEntity]? {
        let query = QueryBuilder
            .select(SelectResult.all())
            .from(DataSource.database(database))
            .where(Expression.property("type").equalTo(Expression.string(Constant.post)))
        
        do {
            let result = try query.execute()
            let results = result.allResults().map { $0.dictionary(forKey: Constant.dbName) }
            var entities: [PostEntity] = []
            for res in results {
                guard let dictionary = res?.dictionary(forKey: "dictionary"),
                      let uid = dictionary.string(forKey: PostEntity.CodingKeys.uid.rawValue),
                      let name = dictionary.string(forKey: PostEntity.CodingKeys.name.rawValue),
                      let email = dictionary.string(forKey: PostEntity.CodingKeys.email.rawValue),
                      let profilePic = dictionary.string(forKey: PostEntity.CodingKeys.profilePic.rawValue),
                      let post = dictionary.dictionary(forKey: PostEntity.CodingKeys.post.rawValue),
                      let postDate = post.string(forKey: PostDetailEntity.CodingKeys.date.rawValue) else {
                    continue
                }
                let postID = post.int(forKey: PostDetailEntity.CodingKeys.id.rawValue)
                var picsURLs: [String] = []
                guard let pics = post.array(forKey: PostDetailEntity.CodingKeys.pics.rawValue) else {
                    continue
                }
                pics.enumerated().forEach { (index, _) in
                    pics.string(at: index).map { picsURLs.append($0) }
                }
                let detail = PostDetailEntity(id: postID,
                                              date: postDate,
                                              pics: picsURLs)
                let postEntity = PostEntity(uid: uid,
                                            name: name,
                                            email: email,
                                            profilePic: profilePic,
                                            post: detail)
                entities.append(postEntity)
            }
            return entities.isEmpty ? nil : entities
        } catch {
            throw CachedPostsServiceError.documentsNotFound
        }
    }
}

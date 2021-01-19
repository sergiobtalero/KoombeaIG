//
//  ReverseMapperPostEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

protocol ObjectMapper {
    associatedtype Inp
    associatedtype Out
    static func map(from input: Inp) -> Out
}

final class PostDetailReverseMapper: ObjectMapper {
    static func map(from input: PostDetail) -> PostDetailEntity {
        PostDetailEntity(id: input.id,
                         date: input.date,
                         pics: input.pics)
    }
}

final class PostReverseMapper: ObjectMapper {
    static func map(from input: Post) -> PostEntity? {
        guard let detail = input.post.map({ PostDetailReverseMapper.map(from: $0) }) else {
            return nil
        }
        return PostEntity(uid: input.uid,
                          name: input.name,
                          email: input.email,
                          profilePic: input.profilePic,
                          post: detail)
    }
}

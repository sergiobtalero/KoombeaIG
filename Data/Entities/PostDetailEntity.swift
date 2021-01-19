//
//  PostDetailEntity.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

struct PostDetailEntity: DataEntity {
    let id: Int
    let date: String
    let pics: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case pics
    }
    
    func toDomain() throws -> PostDetail {
        PostDetail(id: id,
                   date: date,
                   pics: pics)
    }
}

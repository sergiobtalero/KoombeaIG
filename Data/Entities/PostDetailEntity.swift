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
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d yyyy HH:mm:ss Z"
        let picsURL = pics.compactMap { URL(string: $0) }
        
        return PostDetail(id: id,
                          date: dateFormatter.date(from: date),
                          pics: picsURL)
    }
}

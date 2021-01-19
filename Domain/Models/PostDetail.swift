//
//  PostDetail.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public struct PostDetail {
    public let id: Int
    public let date: Date?
    public let pics: [String]
    
    public init(id: Int,
                date: Date?,
                pics: [String]) {
        self.id = id
        self.date = date
        self.pics = pics
    }
}

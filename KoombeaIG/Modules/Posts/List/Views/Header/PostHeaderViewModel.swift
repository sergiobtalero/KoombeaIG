//
//  PostHeaderViewModel.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Foundation

struct PostHeaderViewModel {
    let userProfileImageURL: URL?
    let userName: String
    let userEmail: String
    let postDate: String
    
    init(userProfileImageURL: URL?,
         userName: String,
         userEmail: String,
         postDate: Date?) {
        self.userProfileImageURL = userProfileImageURL
        self.userName = userName
        self.userEmail = userEmail
        
        if let postDate = postDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            self.postDate = dateFormatter.string(from: postDate)
        } else {
            self.postDate = ""
        }
    }
}

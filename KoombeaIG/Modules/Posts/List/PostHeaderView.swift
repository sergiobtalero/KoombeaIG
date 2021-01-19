//
//  PostHeaderView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI

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

struct PostHeaderView: View {
    let viewModel: PostHeaderViewModel
    
    init(viewModel: PostHeaderViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            KFImage(viewModel.userProfileImageURL)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(viewModel.userName)
                    .font(.system(size: 15, weight: .bold))
                Text(viewModel.userEmail)
                    .font(.system(size: 10, weight: .light))
            }
            Spacer()
            Text(viewModel.postDate)
                .font(.system(size: 15))
        }
        .frame(height: 50)
    }
}

struct PostHeaderView_Previews: PreviewProvider {
    static var viewModel: PostHeaderViewModel {
        PostHeaderViewModel(userProfileImageURL: URL(string: "https://mock.koombea.io/profile/profile85.jpg"),
                       userName: "Sergio Bravo",
                       userEmail: "sergio@email.com",
                       postDate: nil)
    }
    static var previews: some View {
        PostHeaderView(viewModel: viewModel)
    }
}

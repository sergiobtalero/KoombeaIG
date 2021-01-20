//
//  PostHeaderView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI

struct PostHeaderView: View {
    let viewModel: PostHeaderViewModel
    
    // MARK: - Initializer
    init(viewModel: PostHeaderViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            PostImage(url: viewModel.userProfileImageURL)
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

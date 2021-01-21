//
//  HeaderView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI
import Domain

struct PostsListView: View {
    private let placeholderImage = UIImage(named: "Portrait_placeholder")!
    private let viewmodels: [PostViewModel]
    
    // MARK: - Initializer
    public init(viewmodels: [PostViewModel]) {
        self.viewmodels = viewmodels
    }
    
    // MARK: - Body
    var body: some View {
        List(viewmodels) { model in
            VStack {
                PostHeaderView(viewModel: model.headerViewModel)
                ImagesContainerView(urls: model.imagesURLs)
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var viewModel: PostViewModel {
        let detail = PostDetail(id: 66444,
                                date: nil,
                                pics: [URL(string: "https://mock.koombea.io/pics/pics40.jpg")!])
        let post = Post(uid: "id",
                    name: "Sergio Bravo",
                    email: "sergiontalero@aol.com",
                    profilePic: "https://mock.koombea.io/profile/profile85.jpg",
                    post: detail)
        return PostViewModel(post: post)
    }
    
    static var previews: some View {
        PostsListView(viewmodels: [viewModel, viewModel, viewModel])
    }
}

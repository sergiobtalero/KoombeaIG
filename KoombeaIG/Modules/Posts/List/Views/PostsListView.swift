//
//  HeaderView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI
import Domain

struct PostViewModel: Identifiable {
    let id = UUID()
    let headerViewModel: PostHeaderViewModel
    let imagesURLs: [URL]
    
    init(post: Post) {
        headerViewModel = PostHeaderViewModel(userProfileImageURL: URL(string: post.profilePic),
                                              userName: post.name,
                                              userEmail: post.email,
                                              postDate: post.post?.date)
        imagesURLs = post.post?.pics.compactMap { URL(string: $0) } ?? []
    }
}

struct PostsListView: View {
    private let viewmodels: [PostViewModel]
    public let placeholderImage = UIImage(named: "Portrait_placeholder")!
    
    public init(posts: [Post]) {
        viewmodels = posts.map { PostViewModel(post: $0) }
    }
    
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
    static var post: Post {
        let detail = PostDetail(id: 66444,
                                date: nil,
                                pics: ["https://mock.koombea.io/pics/pics40.jpg"])
        return Post(uid: "id",
                    name: "Sergio Bravo",
                    email: "sergiontalero@aol.com",
                    profilePic: "https://mock.koombea.io/profile/profile85.jpg",
                    post: detail)
    }
    
    static var previews: some View {
        PostsListView(posts: [post, post, post])
    }
}

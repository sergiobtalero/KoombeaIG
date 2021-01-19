//
//  HeaderView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI
import Domain

struct PostViewModel {
    let headerViewModel: PostHeaderViewModel
    
    init(post: Post) {
        headerViewModel = PostHeaderViewModel(userProfileImageURL: URL(string: post.profilePic),
                                              userName: post.name,
                                              userEmail: post.email,
                                              postDate: post.post?.date ?? "")
    }
}

struct PostView: View {
    private let viewmodel: PostViewModel
    public let placeholderImage = UIImage(named: "Portrait_placeholder")!
    
    public init(post: Post) {
        viewmodel = PostViewModel(post: post)
    }
    
    var body: some View {
        PostHeaderView(viewModel: viewmodel.headerViewModel)
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: Post {
        let detail = PostDetail(id: 66444,
                                date: "Tue Dec 14 2021 00:11:26 GMT-0500 (Colombia Standard Time)",
                                pics: ["https://mock.koombea.io/pics/pics40.jpg"])
        return Post(uid: "id",
                    name: "Sergio Bravo",
                    email: "sergiontalero@aol.com",
                    profilePic: "https://mock.koombea.io/profile/profile85.jpg",
                    post: detail)
    }
    
    static var previews: some View {
        PostView(post: post)
    }
}

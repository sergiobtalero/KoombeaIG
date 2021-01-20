//
//  PostsListStore.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Foundation
import Domain

final class PostsListStore: ObservableObject {
    enum State {
        case loading
        case error(message: String)
        case render(posts: [PostViewModel])
    }
    
    @Published var state: State = .loading
}

extension PostsListStore: PostsListViewContract {
    func showError(message: String) {
        state = .error(message: message)
    }
    
    func showLoading() {
        state = .loading
    }
    
    func renderPosts(_ posts: [PostViewModel]) {
        state = .render(posts: posts)
    }
}

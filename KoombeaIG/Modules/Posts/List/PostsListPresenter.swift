//
//  PostsListPresenter.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

final class PostsListPresenter {
    weak var view: PostsListViewContract?
    private let getPostsListUseCase: GetPostsListUseCaseContract
    private var posts: [Post] = []
    
    // MARK: - Initializer
    init(getPostsListUseCase: GetPostsListUseCaseContract) {
        self.getPostsListUseCase = getPostsListUseCase
    }
}

// MARK: - PostsListPresenterContract
extension PostsListPresenter: PostsListPresenterContract {
    func viewDidLoad() {
        view?.showLoading()
        getPostsListUseCase.execute { [weak self] posts in
            guard let posts = posts else {
                self?.view?.showError(message: "Could not load posts")
                return
            }
            self?.posts = posts
            let viewModels = posts.map { PostViewModel(post: $0) }
            
            self?.view?.renderPosts(viewModels)
        }
    }
}

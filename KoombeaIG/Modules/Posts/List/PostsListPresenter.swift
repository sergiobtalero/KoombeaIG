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
    
    init(getPostsListUseCase: GetPostsListUseCaseContract) {
        self.getPostsListUseCase = getPostsListUseCase
    }
}

extension PostsListPresenter: PostsListPresenterContract {
    func viewDidLoad() {
        view?.showLoading()
        getPostsListUseCase.execute { [weak self] posts in
            guard let posts = posts else {
                self?.view?.showError(message: "Could not load posts")
                return
            }
            self?.posts = posts
            self?.view?.renderPosts(posts)
        }
    }
}

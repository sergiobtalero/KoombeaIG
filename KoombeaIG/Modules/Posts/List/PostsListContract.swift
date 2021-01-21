//
//  PostsListContract.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain

protocol PostsListContract {
    typealias View = PostsListViewContract
    typealias Presenter = PostsListPresenterContract
}


protocol PostsListViewContract: AnyObject {
    func renderPosts(_ posts: [PostViewModel])
    func showError(message: String)
    func showLoading()
}

protocol PostsListPresenterContract {
    func viewDidLoad()
}

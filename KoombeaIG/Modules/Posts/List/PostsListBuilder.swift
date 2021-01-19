//
//  PostsListBuilder.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Injector
import UIKit

final class PostsListBuilder {
    static func build() -> PostsListViewController {
        let vc = PostsListViewController.instantiate(storyboardName: "PostsList")
        let presenter = PostsListPresenter(getPostsListUseCase: PostsInjector.provideGetPostsListUseCase())
        presenter.view = vc
        vc.presenter = presenter
        return vc
    }
}

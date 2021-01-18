//
//  PostsListViewController.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Injector
import Domain
import UIKit

class PostsListViewController: UIViewController {
    var usecase: GetPostsListUseCaseContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usecase = PostsInjector.provideGetPostsListUseCase()
        usecase?.execute(completion: { posts in
//            print(posts)
        })
    }
}

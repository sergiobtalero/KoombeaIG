//
//  PostsListViewController.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Injector
import Domain
import UIKit

final class PostsListViewController: UIViewController {
    var presenter: PostsListPresenterContract?
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension PostsListViewController: PostsListViewContract {
    func renderPosts(_ posts: [Post]) {
        
    }
}

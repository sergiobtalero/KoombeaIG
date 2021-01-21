//
//  PostsListBuilder.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Injector
import SwiftUI
import UIKit

final class PostsListBuilder {    
    static func buildUI() -> PostsView {
        let getPostsListUseCase = PostsInjector.provideGetPostsListUseCase()
        let presenter = PostsListPresenter(getPostsListUseCase: getPostsListUseCase)
        let store = PostsListStore()
        presenter.view = store
        return PostsView(presenter: presenter,
                         store: store)
    }
}

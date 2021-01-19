//
//  PostsListView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Injector
import SwiftUI

struct PostsView: View {
    var presenter: PostsListPresenterContract
    @ObservedObject var store: PostsListStore
    
    init(presenter: PostsListPresenterContract,
         store: PostsListStore) {
        self.store = store
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationView { () -> AnyView in
            switch store.state {
            case .loading:
                return AnyView(Text("Loading"))
            case let .error(message):
                return AnyView(ErrorView(errorMessage: message))
            case let .render(posts):
                print(posts.count)
                return AnyView(PostView(post: posts.first!))
            }
        }
        .onAppear(perform: { presenter.viewDidLoad() })
    }
}

struct PostsView_Previews: PreviewProvider {
    static var dependencies: (presenter: PostsListPresenterContract,
                              store: PostsListStore) {
        let presenter = PostsListPresenter(getPostsListUseCase: PostsInjector.provideGetPostsListUseCase())
        let store = PostsListStore()
        return (presenter: presenter, store: store)
    }
    static var previews: some View {
        
        PostsView(presenter: dependencies.presenter,
                      store: dependencies.store)
    }
}

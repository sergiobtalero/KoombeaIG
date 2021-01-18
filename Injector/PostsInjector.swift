//
//  PostsInjector.swift
//  Injector
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation
import Domain
import Data

public final class PostsInjector {
    public static func provideGetPostsListUseCase() -> GetPostsListUseCaseContract {
        GetPostsListUseCase(provider: providePostsProvider())
    }
}

private extension PostsInjector {
    static func providePostsProvider() -> PostsProviderContract {
        PostsProvider()
    }
}

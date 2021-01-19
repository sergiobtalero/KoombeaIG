//
//  KoombeaIGTests.swift
//  KoombeaIGTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

@testable import KoombeaIG
@testable import Data
import Domain
import XCTest

final class GetPostsListUseCaseMock: GetPostsListUseCaseContract {
    var posts: [Post]?
    
    init(posts: [Post]?) {
        self.posts = posts
    }
    
    func execute(completion: @escaping ([Post]?) -> Void) {
        completion(posts)
    }
}

final class PostsListsStoreMock: PostsListViewContract {
    var didShowPosts = false
    var didShowError = false
    var didShowLoading = false
    
    func renderPosts(_ posts: [Post]) {
        didShowPosts = true
    }
    
    func showError(message: String) {
        didShowError = true
    }
    
    func showLoading() {
        didShowLoading = true
    }
}

class KoombeaIGTests: XCTestCase {

    func testPostsFetchingSuccess() {
        let presenter = PostsListPresenter(getPostsListUseCase: GetPostsListUseCaseMock(posts: getPosts()))
        let store = PostsListsStoreMock()
        presenter.view = store
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(store.didShowPosts)
    }
    
    func testPostsFetchingFailed() {
        let presenter = PostsListPresenter(getPostsListUseCase: GetPostsListUseCaseMock(posts: nil))
        let store = PostsListsStoreMock()
        presenter.view = store
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(store.didShowError)
    }

}

private extension KoombeaIGTests {
    func getPosts() -> [Post] {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Posts", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let response = try? JSONDecoder().decode(RawServerResponse<PostEntity>.self, from: data)
        let models = try? response?.data.toDomain()
        return models ?? []
    }
}

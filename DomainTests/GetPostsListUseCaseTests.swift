//
//  GetPostsListUseCaseTests.swift
//  DomainTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

@testable import Domain
@testable import Data
import XCTest

class GetPostsListUseCaseTests: XCTestCase {
    func testGetPostsListUseCaseSuccess() {
        let provider = PostsProviderMock(posts: getPostsList())
        let usecase = GetPostsListUseCase(provider: provider)
        
        usecase.execute { posts in
            XCTAssertEqual(posts?.first?.name, "Mr. Jacques Aufderhar")
        }
    }
}

private extension GetPostsListUseCaseTests {
    func getPostsList() -> [Post]? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Posts", withExtension: "json") else {
            fatalError("Could not find posts json or load data")
        }
        let data = try! Data(contentsOf: url)
        let response = try? JSONDecoder().decode(RawServerResponse<PostEntity>.self, from: data)
        return try? response?.data.toDomain()
    }
}

//
//  PostsProviderTests.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

@testable import Data
import Domain
import XCTest

class PostsProviderTests: XCTestCase {
    func testGetPostsListSuccess() {
        let expectation = XCTestExpectation(description: "Retrieve list of pokedexes")
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Posts", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            XCTFail("Could not load data")
            return
        }
        let urlSession = MockURLSession(data: data, response: nil, error: nil)
        
        PostsProvider().getPostsList(urlSession: urlSession) { posts in
            XCTAssertEqual(posts?.first?.name, "Mr. Jacques Aufderhar")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
    
    func testGetPostsListFail() {
        let expectation = XCTestExpectation(description: "Retrieve list of pokedexes")
        let urlSession = MockURLSession(data: nil, response: nil, error: PostsProviderError.generic)
        
        PostsProvider().getPostsList(urlSession: urlSession) { posts in
            XCTAssertNil(posts)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
}

//
//  PostsParserTests.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

@testable import Data
import XCTest

class PostsParserTests: XCTestCase {
    func testParsePostJSONSuccess() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Posts", withExtension: "json") else {
            XCTFail("Could not load json file")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(RawServerResponse<PostEntity>.self, from: data)
            XCTAssertEqual(response.data.first?.uid, "78b4e41d-c74a-4be0-abe0-5e097a970b53")
        } catch {
            XCTFail("Could not decode PostEntity")
        }
        XCTAssert(true)
    }
    
    func testPostToDomainSuccess() {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Posts", withExtension: "json") else {
            XCTFail("Could not load json file")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(RawServerResponse<PostEntity>.self, from: data)
            let models = try response.data.toDomain()
            XCTAssertTrue(!models.isEmpty)
        } catch {
            XCTFail("Could not decode PostEntity")
        }
        XCTAssert(true)
    }
}

//
//  MockURLSessionDataTask.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public final class MockURLSessionDataTask: URLSessionDataTask {
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    var completionHandler: CompletionHandler?
    var taskResponse: (Data?, URLResponse?, Error?)?
    
    public override init() {}
    
    public override func resume() {
        completionHandler?(taskResponse?.0, taskResponse?.1, taskResponse?.2)
    }
}

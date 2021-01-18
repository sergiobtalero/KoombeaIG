//
//  MockURLSession.swift
//  DataTests
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

public final class MockURLSession: URLSession {
    var url: URL?
    var request: URLRequest?
    private let dataTask: MockURLSessionDataTask
    
    public init(data: Data?, response: URLResponse?, error: Error?) {
        dataTask = MockURLSessionDataTask()
        dataTask.taskResponse = (data, response, error)
    }
    
    public override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.url = url
        self.dataTask.completionHandler = completionHandler
        return self.dataTask
    }
    
    public override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.request = request
        self.dataTask.completionHandler = completionHandler
        return self.dataTask
    }
}

//
//  PostsService.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

enum PostsService {
    case list
}

extension PostsService: ServiceContract {
    var baseURL: String {
        "https://mock.koombea.io/mt/api"
    }
    
    var path: String? {
        switch self {
        case .list: return "/posts"
        }
    }
    
    var urlRequest: URLRequest? {
        switch self {
        case .list:
            guard let path = path,
                  let url = URL(string: baseURL + path) else {
                return nil
            }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            return request
        }
    }
}

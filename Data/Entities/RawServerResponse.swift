//
//  RawServerResponse.swift
//  Data
//
//  Created by Sergio David Bravo Talero on 18/01/21.
//

import Foundation

struct RawServerResponse<T: Codable>: Codable {
    let data: [T]
}

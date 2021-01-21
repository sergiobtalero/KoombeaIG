//
//  ImagesContainerViewModel.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Foundation
import SwiftUI

enum ImagesContainerLayout {
    case none
    case singleImage(imageURL: URL)
    case singleRow(leftRowURL: URL,
                   rightRowURL: URL)
    case twoRows(firstRowURL: URL,
                 secondRowURLs: [URL])
}

struct ImagesContainerViewModel {
    let layout: ImagesContainerLayout
    
    // MARK: - Initializer
    init(urls: [URL]) {
        if urls.count == 1,
           let url = urls.first {
            layout = .singleImage(imageURL: url)
        } else if urls.count == 2,
                  let leftURL = urls.first,
                  let rightURL = urls.last {
            layout = .singleRow(leftRowURL: leftURL,
                                rightRowURL: rightURL)
        } else if urls.count >= 3,
                  let firstURL = urls.first {
            let secondRowURLs = urls.dropFirst()
            layout = .twoRows(firstRowURL: firstURL,
                              secondRowURLs: Array(secondRowURLs))
        } else {
            layout = .none
        }
    }
}

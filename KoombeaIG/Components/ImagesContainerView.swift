//
//  ImagesContainerView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
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

struct ImagesContainerView: View {
    let viewModel: ImagesContainerViewModel
    
    init(urls: [URL]) {
        viewModel = ImagesContainerViewModel(urls: urls)
    }
    
    private var viewToPresent: AnyView {
        switch viewModel.layout {
        case .none:
            return AnyView(Text("No photos"))
        case let .singleImage(url):
            return AnyView(
                KFImage(url)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
            )
        case let .singleRow(leftRowURL, rightRowURL):
            return AnyView(
                HStack {
                    KFImage(leftRowURL)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    KFImage(rightRowURL)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                }
            )
        case let .twoRows(firstRowURL, urls):
            return AnyView(
                VStack {
                    KFImage(firstRowURL)
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    
                    if urls.count == 2 {
                        HStack {
                            HStack(spacing: 5) {
                                ForEach(0..<2) { index in
                                    KFImage(urls[index])
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                }
                            }
                        }
                    } else {
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach(0..<urls.count) { index in
                                    KFImage(urls[index])
                                        .resizable()
                                        .aspectRatio(1, contentMode: .fit)
                                }
                            }
                        }.frame(height: 100)
                    }
                }
            )
        }
    }
    
    var body: some View {
        viewToPresent
    }
}

struct ImagesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesContainerView(urls: [URL(string: "https://mock.koombea.io/pics/pics40.jpg")!,
                                   URL(string: "https://mock.koombea.io/pics/pics40.jpg")!])
    }
}

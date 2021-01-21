//
//  ImagesContainerView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI

struct ImagesContainerView: View {
    private let viewModel: ImagesContainerViewModel
    
    // MARK: - Iniitalizer
    init(urls: [URL]) {
        viewModel = ImagesContainerViewModel(urls: urls)
    }
    
    var body: some View {
        switch viewModel.layout {
        case .none:
            return makeNoneLayoutView()
        case let .singleImage(url):
            return makeSingleImageLayoutView(url: url)
        case let .singleRow(leftRowURL, rightRowURL):
            return makeSingleRowLayout(leftURL: leftRowURL,
                                       rightURL: rightRowURL)
        case let .twoRows(firstRowURL, urls):
            return makeTwoRowsLayout(topImage: firstRowURL,
                                     bottomImages: urls)
        }
    }
}

// MARK: - Private Methods
private extension ImagesContainerView {
    private func makeNoneLayoutView() -> AnyView {
        return AnyView(Text("No photos"))
    }
    
    private func makeSingleImageLayoutView(url: URL) -> AnyView {
        return AnyView(PostImage(url: url))
    }
    
    private func makeSingleRowLayout(leftURL: URL, rightURL: URL) -> AnyView {
        return AnyView(
            HStack {
                PostImage(url: leftURL)
                PostImage(url: rightURL)
            }
        )
    }
    
    private func makeTwoRowsLayout(topImage: URL, bottomImages: [URL]) -> AnyView {
        return AnyView(
            VStack {
                PostImage(url: topImage)
                
                if bottomImages.count == 2 {
                    HStack {
                        HStack(spacing: 5) {
                            ForEach(0..<2) { index in
                                PostImage(url: bottomImages[index])
                            }
                        }
                    }
                } else {
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            ForEach(0..<bottomImages.count) { index in
                                PostImage(url: bottomImages[index])
                            }
                        }
                    }.frame(height: 100)
                }
            }
        )
    }
}

// MARK: - Preview
struct ImagesContainerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesContainerView(urls: [URL(string: "https://mock.koombea.io/pics/pics40.jpg")!,
                                   URL(string: "https://mock.koombea.io/pics/pics40.jpg")!])
    }
}

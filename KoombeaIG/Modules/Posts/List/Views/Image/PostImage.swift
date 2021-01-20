//
//  PostImage.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import Kingfisher
import SwiftUI

struct PostImage: View {
    private let url: URL?
    
    // MARK: - Initializer
    init(url: URL?) {
        self.url = url
    }
    
    // MARK: - Body
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .gesture(
                TapGesture().onEnded({ _ in
                    print(url)
                })
            )
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(url: URL(string: "https://mock.koombea.io/profile/profile85.jpg")!)
    }
}

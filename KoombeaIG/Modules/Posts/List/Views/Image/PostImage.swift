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
    
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}

struct PostImage_Previews: PreviewProvider {
    static var previews: some View {
        PostImage(url: URL(string: "https://mock.koombea.io/profile/profile85.jpg")!)
    }
}

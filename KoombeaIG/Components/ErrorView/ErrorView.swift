//
//  ErrorView.swift
//  KoombeaIG
//
//  Created by Sergio David Bravo Talero on 19/01/21.
//

import SwiftUI

struct ErrorView: View {
    var errorMessage: String
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Error")
                .font(.system(size: 20, weight: .bold))
            Text(errorMessage)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorMessage: "No se pudo cargar Posts")
    }
}

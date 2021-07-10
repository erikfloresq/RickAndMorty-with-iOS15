//
//  ErrorView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/7/21.
//

import SwiftUI

struct ErrorView: View {
    var error: Error?

    init(_ error: Error? = nil) {
        self.error = error
    }

    var body: some View {
        Text("Error")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}

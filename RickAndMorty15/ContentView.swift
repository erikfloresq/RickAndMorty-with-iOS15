//
//  ContentView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 8/6/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    HStack {
                        AsyncImage(url: URL(string: character.image)!) { image in
                            image.resizable().frame(width: 100, height: 100)
                        } placeholder: {
                            Rectangle().frame(width: 100, height: 100)
                        }
                        Text(character.name)
                    }
                }
            }
            .navigationTitle("Async Await")
        }
        .onAppear {
            async {
                try await viewModel.getCharacter()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

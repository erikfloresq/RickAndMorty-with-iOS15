//
//  CharacterListView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 8/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterListViewModel()
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    CharacterCell(character: character)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Rick&Morty")
        }
        .onAppear {
            async {
                try await viewModel.getCharacter()
            }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}

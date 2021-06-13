//
//  CharacterListView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 8/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterListView: View {
    @EnvironmentObject var viewModel: CharacterListViewModel
    //@EnvironmentObject var favoriteViewModel: FavoriteListViewModel
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    CharacterCell(character: character)
                }
            }
            .searchable(text: $searchText) {
                ForEach(resultSearch) { character in
                    CharacterCell(character: character)
                }
            }
            .navigationTitle("Rick&Morty")
        }
        .onAppear {
            async {
                try await viewModel.getCharacter()
            }
        }
    }

    var resultSearch: [Character] {
        if searchText.isEmpty {
            return viewModel.characters
        } else {
            return viewModel.characters.filter { $0.name.contains(searchText) }
        }
    }
}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}

//
//  CharacterGridView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 13/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterGridView: View {
    @EnvironmentObject var viewModel: CharacterListViewModel
    @EnvironmentObject var favoriteViewModel: FavoriteListViewModel
    @State private var searchText: String = ""
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.characters) { character in
                    CharacterItem(character: character)
                }
            }
        }
        .searchable(text: $searchText) {
            ForEach(resultSearch) { character in
                CharacterCell(character: character)
                    .contextMenu {
                        Button {
                            favoriteViewModel.addFavorite(character: character)
                        } label: {
                            Image(systemName: "star")
                            Text("Favorite")
                        }
                    }
            }
        }
        .task {
            await viewModel.getCharacter()
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

struct CharacterGridView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGridView()
    }
}

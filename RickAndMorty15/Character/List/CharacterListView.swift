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
    @EnvironmentObject var favoriteViewModel: FavoriteListViewModel
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(destination: DetailCharacterView(character: character)) {
                        CharacterCell(character: character)
                    }
                    .swipeActions {
                        Button {
                            favoriteViewModel.addFavorite(character: character)
                        } label: {
                            Image(systemName: "star")
                            Text("Favorite")
                        }.tint(Color(.systemYellow))
                    }
                }
            }
            .searchable(text: $searchText) {
                ForEach(resultSearch) { character in
                    CharacterCell(character: character)
                }
            }
            .refreshable {
                await viewModel.getCharacter()
            }
            .task {
                await viewModel.getCharacter()
            }
            .navigationTitle("Rick&Morty")
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

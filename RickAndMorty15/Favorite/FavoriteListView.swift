//
//  FavoriteListView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct FavoriteListView: View {
    @EnvironmentObject var viewModel: FavoriteListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.favorites) { character in
                    CharacterCell(character: character)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
//
//struct FavoriteListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteListView(viewModel: )
//    }
//}

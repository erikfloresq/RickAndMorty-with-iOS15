//
//  FavoriteGridView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 13/6/21.
//

import SwiftUI

struct FavoriteGridView: View {
    @EnvironmentObject var viewModel: FavoriteListViewModel
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300)),
        GridItem(.flexible(minimum: 100, maximum: 300))
    ]

    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.favorites) { character in
                    CharacterItem(character: character)
                }
            }
        }
    }
}

//struct FavoriteGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteGridView()
//    }
//}

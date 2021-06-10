//
//  FavoriteListViewModel.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import Foundation
import RickAndMortyAPI

class FavoriteListViewModel: ObservableObject {
    @Published var favorites = [Character]()
}

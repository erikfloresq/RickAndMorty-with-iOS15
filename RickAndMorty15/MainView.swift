//
//  MainView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var characterViewModel = CharacterListViewModel()
    //@StateObject var favoriteViewModel = FavoriteListViewModel()

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            CharacterGridView()
                .environmentObject(characterViewModel)
        } else {
            CharacterListView()
                .environmentObject(characterViewModel)
        }
    }
}

//        TabView {
//            CharacterListView()
//                .environmentObject(characterViewModel)
//                .environmentObject(favoriteViewModel)
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Characters")
//                }
//            FavoriteListView()
//                .environmentObject(favoriteViewModel)
//                .tabItem {
//                    Image(systemName: "star")
//                    Text("Favorites")
//                }
//        }

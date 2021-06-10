//
//  MainView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CharacterListView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            FavoriteListView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}

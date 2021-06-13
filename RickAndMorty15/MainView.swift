//
//  MainView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import SwiftUI

struct MainView: View {
    @StateObject var characterViewModel = CharacterListViewModel()
    @StateObject var favoriteViewModel = FavoriteListViewModel()

    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView {
                List {
                    NavigationLink(destination:
                                    CharacterGridView()
                                        .environmentObject(characterViewModel)
                                        .environmentObject(favoriteViewModel)
                    ) {
                        Image(systemName: "person")
                        Text("Characters")
                            .foregroundColor(Color(.systemYellow))
                    }
                    NavigationLink(destination:
                                    FavoriteGridView()
                                        .environmentObject(favoriteViewModel)
                    ) {
                        Image(systemName: "star")
                        Text("Favorites")
                            .foregroundColor(Color(.systemYellow))
                    }
                }
                .navigationTitle("RickAndMorty")
                .listStyle(.sidebar)
                CharacterGridView()
                    .environmentObject(characterViewModel)
                    .environmentObject(favoriteViewModel)
            }
        } else {
            TabView {
                CharacterListView()
                    .environmentObject(characterViewModel)
                    .environmentObject(favoriteViewModel)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Characters")
                    }
                FavoriteListView()
                    .environmentObject(favoriteViewModel)
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favorites")
                    }
            }
        }
    }
}



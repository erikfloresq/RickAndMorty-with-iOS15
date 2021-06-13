//
//  CharacterItem.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 13/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterItem: View {
    let character: Character
    @EnvironmentObject var favoriteViewModel: FavoriteListViewModel

    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: character.image)!) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    VStack {
                        Spacer()
                        ZStack {
                            LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                            Text(character.name)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }.frame(height: 100)
                    }
                } else if phase.error != nil {
                    Color(.systemRed)
                } else {
                    Color(.systemGray2)
                }
            }
        }
        .frame(minWidth: 100,
              maxWidth: 300,
              minHeight: 100,
              maxHeight: 300)
       .padding()
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

struct CharacterItem_Previews: PreviewProvider {
    static let character = CharacterMock.getCharacter()!

    static var previews: some View {
        CharacterItem(character: character)
                        .previewLayout(.sizeThatFits)

    }
}

//
//  CharacterCell.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 10/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct CharacterCell: View {
    let character: Character
    @EnvironmentObject var favoriteViewModel: FavoriteListViewModel

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)!, transaction: .init(animation: .spring())) { phase in
                switch phase {
                    case .empty:
                        randomPlaceholderColor()
                            .opacity(0.2)
                            .transition(.opacity.combined(with: .scale))
                    case .success(let image):
                        image.resizable()
                    case .failure(let error):
                        ErrorView(error)
                    @unknown default:
                        ErrorView()
                }
            }
            .frame(width: 100, height: 100)
            .mask(RoundedRectangle(cornerRadius: 16))
            Text(character.name)
        }.swipeActions {
            Button {
                favoriteViewModel.addFavorite(character: character)
            } label: {
                Image(systemName: "star")
                Text("Favorite")
            }.tint(Color(.systemYellow))
        }
    }

    func randomPlaceholderColor() -> Color {
        let placeholderColors: [Color] = [
          .red, .blue, .orange, .mint, .purple, .yellow, .green, .pink
        ]

        return placeholderColors.randomElement()!
    }
}


//struct CharacterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCell(character: Character(from: decoder?!!))
//    }
//}

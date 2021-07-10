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
            AsyncImage(url: URL(string: character.image)!, transaction: .init(animation: .spring())) { phase in
                switch phase {
                    case .empty:
                        randomPlaceholderColor()
                            .opacity(0.2)
                            .transition(.opacity.combined(with: .scale))
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .transition(.opacity.combined(with: .scale))
                    case .failure(let error):
                        ErrorView(error)
                    @unknown default:
                        ErrorView()
                }
            }
            .frame(width: 180, height: 200)
            VStack {
                Spacer()
                LinearGradient(colors: [.black, .clear], startPoint: .bottom, endPoint: .top)
                    .frame(height: 70)
            }
            VStack {
                Spacer()
                Text(character.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding([.leading, .trailing, .bottom], 7)
            }
        }
        .contentShape(RoundedRectangle(cornerRadius: 16))
        .clipped()
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

    func randomPlaceholderColor() -> Color {
        let placeholderColors: [Color] = [
          .red, .blue, .orange, .mint, .purple, .yellow, .green, .pink
        ]

        return placeholderColors.randomElement()!
    }
}

struct CharacterItem_Previews: PreviewProvider {
    static let character = CharacterMock.getCharacter()!

    static var previews: some View {
        CharacterItem(character: character)
                        .previewLayout(.sizeThatFits)

    }
}

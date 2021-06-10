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

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)!) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color(.systemRed)
                } else {
                    Color(.systemGray2)
                }
            }
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            Text(character.name)
        }.swipeActions {
            Button {
                print("Add to fav")
            } label: {
                Image(systemName: "star")
                Text("Favorite")
            }.tint(Color(.systemYellow))
        }
    }
}

//struct CharacterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCell(character: Character(from: <#Decoder#>))
//    }
//}

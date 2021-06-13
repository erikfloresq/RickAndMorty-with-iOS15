//
//  DetalleCharacterView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 11/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct DetalleCharacterView: View {
    let character: Character
    let columns = [GridItem(.flexible(minimum: 100, maximum: 200),
                            spacing: 10, alignment: .leading),
                   GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10, alignment: .leading)]

    var body: some View {
        HStack {
            ZStack {
                Image(character.image)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 400)
                VStack {
                    Spacer()
                    HStack {
                        Text(character.name)
                        Spacer()
                    }
                }

            }
            LazyVGrid(columns: columns) {
                Text("Created")
                Text(character.created)
                Text("Gender")
                Text(character.gender)
                Text("Type")
                Text(character.type)
                Text("Speacies")
                Text(character.species)
                Text("Location")
                Text(character.location.name)
            }
        }
    }
}

struct DetalleCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        DetalleCharacterView(character: CharacterMock.getCharacter()!)
    }
}

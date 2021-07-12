//
//  DetalleCharacterView.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 11/6/21.
//

import SwiftUI
import RickAndMortyAPI

struct DetailCharacterView: View {
    let character: Character
    let columns = [GridItem(.flexible(minimum: 100, maximum: 100),
                            spacing: 10, alignment: .leading),
                   GridItem(.flexible(minimum: 100, maximum: 300), spacing: 10, alignment: .leading)]

    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: character.image)!, transaction: .init(animation: .spring())) { phase in
                    switch phase {
                        case .empty:
                            Color.black
                                .opacity(0.2)
                                .transition(.opacity.combined(with: .scale))
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .transition(.opacity.combined(with: .scale))
                        case .failure(let error):
                            ErrorView(error)
                        @unknown default:
                            ErrorView()
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Text(character.name)
                            .font(.title)
                            .bold()
                            .padding(.bottom, 30)
                    }
                }

            }.frame(maxWidth: .infinity, maxHeight: 400)
            LazyVGrid(columns: columns) {
                DetailCharacterCell(key: "Created",
                                    value: formattedDate(from: character.created))
                DetailCharacterCell(key: "Gender",
                                    value: character.gender)
                DetailCharacterCell(key: "Type",
                                    value: character.type)
                DetailCharacterCell(key: "Speacies",
                                    value: character.species)
                DetailCharacterCell(key: "Location",
                                    value: character.name)
            }
            .padding([.top, .horizontal], 15)
            .background(Color(.systemBackground))
            .mask(RoundedRectangle(cornerRadius: 20))
            .offset(x: 0, y: -30)
            Spacer()
        }
        .ignoresSafeArea()
    }

    func getDate(from date: String) -> Date? {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let drawDate = formatDate.date(from: date)
        return drawDate
    }

    func formattedDate(from date: String) -> String {
        guard let decoderDate = getDate(from: date) else {
            return "🕐"
        }
        return decoderDate.formatted()
    }
}

struct DetailCharacterCell: View {
    let key: String
    let value: String

    var body: some View {
        Group {
            Text("**\(key)**")
            Text(value).textSelection(.enabled)
        }
        .padding(.vertical, 5)
    }
}

struct DetailCharacterView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCharacterView(character: CharacterMock.getCharacter()!)
    }
}

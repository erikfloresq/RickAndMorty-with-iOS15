//
//  CharacterListViewModel.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 8/6/21.
//

import Foundation
import RickAndMortyAPI
import Combine

class CharacterListViewModel: ObservableObject {
    let rickAndMortyAPI = RickAndMortyAPI()
    @Published var characters = [Character]()
    var cancellable = Set<AnyCancellable>()

    func getCharacter() {
        rickAndMortyAPI
            .getCharacter()
            .map { $0.results }
            .sink { (completion) in
                print("")
            } receiveValue: { (characters) in
                self.characters = characters
            }.store(in: &cancellable)
    }

//    func getCharacter() async throws {
//        do {
//            let (data, error) = try await URLSession.shared.data(from: URL(string: "https://rickandmortyapi.com/api/character")!, delegate: nil)
//            let characters = try JSONDecoder().decode(ResponseAPI<Character>.self, from: data)
//            self.characters = characters.results
//        } catch(let error) {
//            throw error
//        }
//    }
}


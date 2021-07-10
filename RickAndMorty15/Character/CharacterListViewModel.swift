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

    func getCharacter() async {
        do {
            let resultApi = try await rickAndMortyAPI.getCharacter()
            characters = resultApi.results
        } catch(let error) {
            print(error)
        }
    }
}


//
//  ViewModel.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 8/6/21.
//

import Foundation
import RickAndMortyAPI
import Combine

class ViewModel: ObservableObject {
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
}


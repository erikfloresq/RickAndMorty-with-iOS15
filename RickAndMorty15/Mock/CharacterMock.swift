//
//  CharacterMock.swift
//  RickAndMorty15
//
//  Created by Erik Flores on 11/6/21.
//

import Foundation
import RickAndMortyAPI

struct CharacterMock {

    static func getCharacter() -> Character? {
        let bundleUrl = Bundle.main.url(forResource: "Character", withExtension: "json")
        guard let url = bundleUrl else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        guard let character = try? JSONDecoder().decode(Character.self, from: data) else {
            return nil
        }
        return character

    }
}

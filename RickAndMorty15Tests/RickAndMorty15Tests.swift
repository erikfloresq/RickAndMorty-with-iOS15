//
//  RickAndMorty15Tests.swift
//  RickAndMorty15Tests
//
//  Created by Erik Flores on 13/6/21.
//

import XCTest
@testable import RickAndMorty15

class RickAndMorty15Tests: XCTestCase {
    func testExample() throws {
        let character = try XCTUnwrap(CharacterMock.getCharacter())
        XCTAssertEqual(character.name, "Rick Sanchez")
    }

}

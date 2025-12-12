//
//  MockCharacterService.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

class MockCharacterService: CharacterServicing {
	let characters: [GOTCharacter] = []

	func fetchCharacters() async throws -> [GOTCharacter] {
		return characters
	}
}

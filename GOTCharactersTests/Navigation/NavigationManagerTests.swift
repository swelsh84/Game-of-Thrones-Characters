//
//  NavigationManagerTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 14/12/2025.
//

import Testing

struct NavigationManagerTests {

    @Test func test_showDetailCharacter_appendsPath() async throws {
		let navigationManager = NavigationManager()

		let character = GOTCharacterDTO.daenerysTargaryen.toDomain()

		navigationManager.showCharacterDetail(character)

		#expect(navigationManager.path == [.characterDetail(character)])
    }

}

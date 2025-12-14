//
//  GOTCharacterTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 14/12/2025.
//

import Testing

struct GOTCharacterTests {
	@Test func test_matchingEddard_returnsSingleEntryArray() {
		let characters = [
			GOTCharacterDTO.eddardStark.toDomain(),
			GOTCharacterDTO.tyrionLannister.toDomain()
		]

		let textToSearch = "Eddard"

		let filteredCharacters = characters.filter {
			$0.matches(text: textToSearch)
		}

		#expect(filteredCharacters.count == 1)
		if let character = filteredCharacters.first {
			#expect(character.name == "Eddard Stark")
			#expect(character.gender == "Male")
		}
	}

	@Test func test_matchingValyrianCulture_returnsSingleEntryArray() {
		let characters = [
			GOTCharacterDTO.eddardStark.toDomain(),
			GOTCharacterDTO.tyrionLannister.toDomain(),
			GOTCharacterDTO.daenerysTargaryen.toDomain()
		]

		let textToSearch = "Valyrian"

		let filteredCharacters = characters.filter {
			$0.matches(text: textToSearch)
		}

		#expect(filteredCharacters.count == 1)
		if let character = filteredCharacters.first {
			#expect(character.name == "Daenerys Targaryen")
			#expect(character.playedBy == ["Emilia Clarke"])
		}
	}

	@Test func test_matchingNed_returnsTwoValueEntryArray() {
		let characters = [
			GOTCharacterDTO.eddardStark.toDomain(),
			GOTCharacterDTO.tyrionLannister.toDomain(),
			GOTCharacterDTO.daenerysTargaryen.toDomain(),
			GOTCharacterDTO.jonSnow.toDomain()
		]

		let textToSearch = "Ned"

		let filteredCharacters = characters.filter {
			$0.matches(text: textToSearch)
		}

		#expect(filteredCharacters.count == 2)
	}
}

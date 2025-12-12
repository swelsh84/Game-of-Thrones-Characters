//
//  GOTCharacterDTOTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Testing

struct GOTCharacterDTOTests {

    @Test func test_GOTCharacterDTO_toDomain_createsGOTCharacter() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.

		let dto = GOTCharacterDTO(
			name: "Eddard Stark",
			culture: "Northmen",
			born: "In 263 AC, at Winterfell",
			died: "In 299 AC, at Great Sept of Baelor in King's Landing",
			tvSeries: [
				"Season 1",
				"Season 6"
			],
			gender: "Male",
			titles: [
				"Lord of Winterfell",
				"Warden of the North",
				"Hand of the King",
				"Protector of the Realm",
				"Regent"
			],
			aliases: [
				"Ned",
				"The Ned",
				"The Quiet Wolf"
			],
			playedBy: [
				"Sean Bean",
				"Sebastian Croft",
				"Robert Aramayo"
			]
		)

		let character = dto.toDomain()

		#expect(character.name == dto.name)
		#expect(character.culture == dto.culture)
		#expect(character.born == dto.born)
		#expect(character.tvSeries == dto.tvSeries)
	}
}

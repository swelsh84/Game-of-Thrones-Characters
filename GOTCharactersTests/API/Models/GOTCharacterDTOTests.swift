//
//  GOTCharacterDTOTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Testing

struct GOTCharacterDTOTests {

    @Test func test_GOTCharacterDTO_toDomain_createsGOTCharacter() async throws {
		let dto = GOTCharacterDTO.eddardStark

		let character = dto.toDomain()

		#expect(character.name == dto.name)
		#expect(character.culture == dto.culture)
		#expect(character.born == dto.born)
		#expect(character.tvSeries == dto.tvSeries)
	}
}

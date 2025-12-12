//
//  Array+ExtensionsTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Testing

struct Array_ExtensionsTests {

	@Test func test_SingleSeason_becomesI() async throws {
		let tvSeries = ["Season 1"]
		let text = tvSeries.toRomanNumerals()
		#expect(text == "I")
	}

	@Test func test_Season1AndSeason6_becomeIandVI() async throws {
		let tvSeries = ["Season 1", "Season 6"]
		let text = tvSeries.toRomanNumerals()

		#expect(text == "I, VI")
	}

	@Test func test_allSeasons_isCorrectlyCreated() async throws {
		let tvSeries = ["Season 1", "Season 2", "Season 3", "Season 4", "Season 5", "Season 6", "Season 7", "Season 8"]
		let text = tvSeries.toRomanNumerals()

		#expect(text == "I, II, III, IV, V, VI, VII, VIII")
	}

}

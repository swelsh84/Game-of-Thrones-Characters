//
//  Strings+ExtensionsTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Testing

struct Strings_ExtensionsTests {

	@Test func test_SingleSeason_becomesI() async throws {
		let tvSeries = "Season 1"
		let text = tvSeries.tvSeriesToRomanNumeral()
		#expect(text == "I")
	}

	@Test func test_Season2AndSeason6_becomesII() async throws {
		let tvSeries = "Season 2"
		let text = tvSeries.tvSeriesToRomanNumeral()

		#expect(text == "II")
	}

	@Test func test_Season8_becomesVIII() async throws {
		let tvSeries = "Season 8"
		let text = tvSeries.tvSeriesToRomanNumeral()

		#expect(text == "VIII")
	}
}

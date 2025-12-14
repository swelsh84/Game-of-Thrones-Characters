//
//  GOTCharacter.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

struct GOTCharacter: Identifiable {
	let id = UUID()
	let name: String
	let culture: String
	let born: String
	let died: String
	let tvSeries: [String]
	let gender: String
	let titles: [String]
	let aliases: [String]
	let playedBy: [String]

	var displayableTvSeries: String {
		tvSeries.toRomanNumerals()
	}

	var displayableDied: String {
		died.isEmpty ? "N/A" : died
	}
	var displayableCulture: String {
		culture.isEmpty ? "N/A" : culture
	}
}

extension GOTCharacter {
	func matches(text: String) -> Bool {
		guard !text.isEmpty else { return true }

		let searchableStrings = [
			name,
			culture
		] + titles + aliases

		return searchableStrings.contains {
			$0.localizedCaseInsensitiveContains(text)
		}
	}
}

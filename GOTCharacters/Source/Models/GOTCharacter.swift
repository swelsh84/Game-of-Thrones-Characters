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
		tvSeries.joined(separator: ", ")
	}

	var displayableDied: String {
		died.isEmpty ? "????" : died
	}
	var displayableCulture: String {
		culture.isEmpty ? "????" : culture
	}
}

extension GOTCharacter {
	static var mockData : GOTCharacter {
		.init(
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
	}
}

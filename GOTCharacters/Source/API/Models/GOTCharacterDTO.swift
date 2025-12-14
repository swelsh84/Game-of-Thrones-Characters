//
//  GOTCharacterDTO.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

struct GOTCharacterDTO: Decodable {
	let name: String
	let culture: String
	let born: String
	let died: String
	let tvSeries: [String]
	let gender: String
	let titles: [String]
	let aliases: [String]
	let playedBy: [String]
}

extension GOTCharacterDTO {
	func toDomain() -> GOTCharacter {
		GOTCharacter(
			name: name,
			culture: culture,
			born: born,
			died: died,
			tvSeries: tvSeries,
			gender: gender,
			titles: titles,
			aliases: aliases,
			playedBy: playedBy
		)
	}
}

/// Mock Data Creation Methods

extension GOTCharacterDTO {
	static var eddardStark: GOTCharacterDTO {
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

	static var tyrionLannister: GOTCharacterDTO {
		.init(
			name: "Tyrion Lannister",
			culture: "",
			born: "In 273 AC, at Casterly Rock",
			died: "",
			tvSeries: [
				"Season 1",
				"Season 2",
				"Season 3",
				"Season 4",
				"Season 5",
				"Season 6"
			],
			gender: "Male",
			titles: [
				"Acting Hand of the King (former)",
				"Master of Coin (former)"
			],
			aliases: [
				"The Imp",
				"Halfman",
				"The boyman",
				"Giant of Lannister",
				"Lord Tywin's Doom",
				"Lord Tywin's Bane",
				"Yollo",
				"Hugor Hill",
				"No-Nose",
				"Freak",
				"Dwarf"
			],
			playedBy: [
				"Peter Dinklage"
			]
		)
	}

	static var daenerysTargaryen: GOTCharacterDTO {
		.init(
			name: "Daenerys Targaryen",
			culture: "Valyrian",
			born: "In 284 AC, at Dragonstone",
			died: "",
			tvSeries: [
				"Season 1",
				"Season 2",
				"Season 3",
				"Season 4",
				"Season 5",
				"Season 6"
			],
			gender: "Female",
			titles: [
				"Queen of the Andals and the Rhoynar and the First Men, Lord of the Seven Kingdoms",
				"Khaleesi of the Great Grass Sea",
				"Breaker of Shackles/Chains",
				"Queen of Meereen",
				"Princess of Dragonstone"
			],
			aliases: [
				"Dany",
				"Daenerys Stormborn",
				"The Unburnt",
				"Mother of Dragons",
				"Mother",
				"Mhysa",
				"The Silver Queen",
				"Silver Lady",
				"Dragonmother",
				"The Dragon Queen",
				"The Mad King's daughter"
			],
			playedBy: [
				"Emilia Clarke"
			]
		)
	}

	static var jonSnow: GOTCharacterDTO {
		.init(
			name: "Jon Snow",
			culture: "Northmen",
			born: "In 283 AC",
			died: "",
			tvSeries: [
				"Season 1",
				"Season 2",
				"Season 3",
				"Season 4",
				"Season 5",
				"Season 6"
			],
			gender: "Male",
			titles: [
				"Lord Commander of the Night's Watch"
			],
			aliases: [
				"Lord Snow",
				"Ned Stark's Bastard",
				"The Snow of Winterfell",
				"The Crow-Come-Over",
				"The 998th Lord Commander of the Night's Watch",
				"The Bastard of Winterfell",
				"The Black Bastard of the Wall",
				"Lord Crow"
			],
			playedBy: [
				"Kit Harington"
			]
		)
	}
}

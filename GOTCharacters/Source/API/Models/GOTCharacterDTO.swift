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

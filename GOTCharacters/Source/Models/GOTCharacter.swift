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
}

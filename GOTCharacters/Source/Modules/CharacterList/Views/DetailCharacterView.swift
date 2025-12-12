//
//  DetailCharacterView.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import SwiftUI

struct DetailCharacterView: View {
	let character: GOTCharacter

	var body: some View {
		Form {
			Section("Gender") {
				Text(character.gender)
			}
			Section("Culture") {
				Text(character.displayableCulture)
			}
			Section("Born") {
				Text(character.born)
			}
			Section("Died") {
				Text(character.displayableDied)
			}
			Section("TV Series") {
				Text(character.displayableTvSeries)
			}
			Section("Titles") {
				ForEach(character.titles, id: \.self) { title in
					Text(title)
				}
			}
			Section("Aliases") {
				ForEach(character.aliases, id: \.self) { alias in
					Text(alias)
				}
			}
			Section("Played By") {
				ForEach(character.playedBy, id: \.self) { actor in
					Text(actor)
				}
			}
		}
		.navigationTitle(character.name)
		.navigationBarTitleDisplayMode(.large)
	}
}

#Preview {
	DetailCharacterView(character: GOTCharacter.mockData)
}

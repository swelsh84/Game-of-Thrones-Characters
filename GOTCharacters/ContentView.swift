//
//  ContentView.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var navigator = NavigationManager()

	var body: some View {
		NavigationStack(path: $navigator.path) {
			CharacterListView(navigator: navigator, service: CharacterService())
				.navigationDestination(for: AppScreen.self, destination: { screen in
					switch screen {
					case .characterDetail(let character):
						DetailCharacterView(character: character)
					}
				})
		}
	}
}

#Preview {
    ContentView()
}

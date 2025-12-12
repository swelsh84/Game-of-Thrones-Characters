//
//  CharacterListView.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import SwiftUI

struct CharacterListView: View {
	@StateObject var viewModel = CharacterListViewModel(service: CharacterService())

	var body: some View {
		NavigationStack {
			switch viewModel.loadingState {
			case .loading:
				ProgressView()
			case .loaded:
				list()
			case .error:
				VStack {
					ErrorView(title: viewModel.errorTitle, message: viewModel.errorMessage)

					retryButton()
				}
			}
		}
		.task {
			await viewModel.fetchCharacters()
		}
	}

	@ViewBuilder
	func list() -> some View {
		List(viewModel.characters, id: \.id) { character in
			NavigationLink(destination: DetailCharacterView(character: character)) {
				VStack(spacing: 20) {
					HStack {
						Text(character.name)

						Spacer()

						Text(character.displayableCulture)
					}

					VStack(alignment: .leading) {
						HStack {
							Text(character.born)

							Text(" - ")

							Text(character.displayableDied)
						}
						.padding(.bottom)

						Text(character.displayableTvSeries)
					}
					.font(.footnote)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			}
		}
		.refreshable {
			await viewModel.fetchCharacters()
		}
	}

	@ViewBuilder
	func retryButton() -> some View {
		Button {
			Task {
				await viewModel.fetchCharacters()
			}
		} label: {
			Text("Retry")
				.foregroundColor(.white)
				.padding()
				.frame(maxWidth: .infinity)
				.background(Color.blue)
				.cornerRadius(12)
				.padding()
		}
		.padding(.top)
	}
}

#Preview {
    CharacterListView()
}

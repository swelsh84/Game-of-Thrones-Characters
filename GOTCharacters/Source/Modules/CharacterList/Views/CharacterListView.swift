//
//  CharacterListView.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import SwiftUI

struct CharacterListView: View {
	@StateObject var viewModel: CharacterListViewModel

	init(navigator: Navigatable, service: CharacterServicing) {
		_viewModel = StateObject(
			wrappedValue: CharacterListViewModel(
				navigator: navigator,
				service: service
			)
		)
	}

	var body: some View {
		VStack {
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
		List(viewModel.filteredCharacters, id: \.id) { character in
			Button {
				viewModel.tappedCharacter(character)
			} label: {
				HStack {
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
						.frame(maxWidth: .infinity, alignment: .leading)
						.font(.footnote)
					}

					Spacer()

					Image(systemName: "chevron.right")
						.foregroundColor(.secondary)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			}
			.buttonStyle(.plain)
		}
		.refreshable {
			await viewModel.fetchCharacters()
		}
		.searchable(text: $viewModel.searchText, prompt: "Search Characters")
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
	let service = MockCharacterService()
	service.characters = [
		GOTCharacterDTO.eddardStark.toDomain(),
		GOTCharacterDTO.jonSnow.toDomain()
	]

	return CharacterListView(navigator: NavigationManager(), service: service)
}

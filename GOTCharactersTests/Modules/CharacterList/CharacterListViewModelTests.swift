//
//  CharacterListViewModelTests.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation
import Testing

struct CharacterListViewModelTests {

	@MainActor
	@Test func test_loadingStateIsLoaded_whenCharactersAreLoaded() async {
		let service = MockCharacterService()
		service.characters = loadMockData()

		let viewModel = CharacterListViewModel(
			navigator: MockNavigationManager(),
			service: service)

		await viewModel.fetchCharacters()

		#expect(viewModel.characters.count == 2)
		#expect(viewModel.loadingState == .loaded)
	}

	@MainActor
	@Test func test_loadingStateIsError_whenNoCharactersAreLoaded() async {
		let service = MockCharacterService()

		let viewModel = CharacterListViewModel(
			navigator: MockNavigationManager(),
			service: service
		)

		await viewModel.fetchCharacters()

		#expect(viewModel.characters.count == 0)
		#expect(viewModel.loadingState == .error)
		#expect(viewModel.errorTitle == "Unknown Error")
		#expect(viewModel.errorMessage == "Please try again")
	}

	private func loadMockData() -> [GOTCharacter] {

		let decoder = JSONDecoder()
		do {
			let dtos = try decoder.decode([GOTCharacterDTO].self, from: MockDataHelper.mockData)
			return dtos.map { $0.toDomain() }
		} catch {
			print("There was an error")
			return []
		}
	}

	@MainActor
	@Test func test_navigationToCharacterDetail_updatesNavigatorToCorrectCharacter() {
		let navigator = MockNavigationManager()
		let viewModel = CharacterListViewModel(
			navigator: navigator,
			service: MockCharacterService()
		)

		let character = GOTCharacterDTO.eddardStark.toDomain()

		viewModel.tappedCharacter(character)

		#expect(navigator.character?.id == character.id)
	}

}

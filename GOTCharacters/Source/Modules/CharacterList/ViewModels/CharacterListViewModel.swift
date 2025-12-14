//
//  CharacterListViewModel.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation
import Combine

@MainActor
class CharacterListViewModel: ObservableObject, ErrorHandling {

	@Published var characters: [GOTCharacter] = [] {
		didSet {
			self.filteredCharacters = characters
		}
	}

	@Published var loadingState: LoadingState = .loading

	@Published var errorTitle = ""
	@Published var errorMessage = ""

	@Published var searchText = ""
	@Published var filteredCharacters: [GOTCharacter] = []

	private var cancellables = Set<AnyCancellable>()

	let service: CharacterServicing

	init(service: CharacterServicing) {
		self.service = service

		$searchText
			.removeDuplicates()
			.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
			.map { text in
				self.characters.filter { $0.matches(text: text) }
			}
			.assign(to: &$filteredCharacters)
	}

	func fetchCharacters() async {
		self.loadingState = .loading
		do {
			self.characters = try await service.fetchCharacters()
			if !self.characters.isEmpty {
				self.loadingState = .loaded
			} else {
				self.loadingState = .error
				captureError(GenericError.unknown)
			}
		} catch let error as AppError {
			self.loadingState = .error
			self.captureError(error)
		} catch {
			self.loadingState = .error
			captureError(GenericError.unknown)
		}
	}

	private func captureError(_ error: AppError) {
		handleError(error)

		if let networkError = error as? NetworkError {
			switch networkError {
			case .badURL, .badServerResponse:
				self.errorTitle = "API Connection Issue"
				self.errorMessage = "There was an error connecting to the server"
			case .decodingFailed:
				self.errorTitle = "Corrupted Data"
				self.errorMessage = "The server data could not be converted"
			}
		} else {
			self.errorTitle = "Unknown Error"
			self.errorMessage = "Please try again"
		}
	}
}

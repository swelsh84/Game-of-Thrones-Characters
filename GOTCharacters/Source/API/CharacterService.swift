//
//  CharacterService.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

enum NetworkError: AppError {
	case badURL
	case badServerResponse
	case decodingFailed
}

protocol CharacterServicing {
	func fetchCharacters() async throws -> [GOTCharacter]
}

class CharacterService: CharacterServicing {

	func fetchCharacters() async throws -> [GOTCharacter] {
		guard let url = URL(string: "\(Config.baseURL)/characters") else {
			throw NetworkError.badURL
		}

		var request = URLRequest(url: url)
		request.setValue("Bearer \(Config.bearerToken)", forHTTPHeaderField: "Authorization")

		let (data, response) = try await URLSession.shared.data(for: request)

		guard let httpResponse = response as? HTTPURLResponse,
			  (200...299).contains(httpResponse.statusCode) else {
			throw NetworkError.badServerResponse
		}

		let decoder = JSONDecoder()

		do {
			let dtos = try decoder.decode([GOTCharacterDTO].self, from: data)
			return dtos.map { $0.toDomain() }
		} catch {
			throw NetworkError.decodingFailed
		}
	}
}

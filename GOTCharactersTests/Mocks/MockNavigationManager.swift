//
//  MockNavigationManager.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 14/12/2025.
//

import Foundation
import Combine

final class MockNavigationManager: Navigatable {
	var character: GOTCharacter?

	func showCharacterDetail(_ character: GOTCharacter) {
		self.character = character
	}
}

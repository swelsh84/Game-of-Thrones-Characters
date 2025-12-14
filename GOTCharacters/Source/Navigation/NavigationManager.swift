//
//  NavigationManager.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 14/12/2025.
//

import Foundation
import Combine

enum AppScreen: Hashable {
	case characterDetail(_ character: GOTCharacter)
}

protocol Navigatable: AnyObject {
	func showCharacterDetail(_ character: GOTCharacter)
}

final class NavigationManager: ObservableObject {
	@Published var path: [AppScreen] = []

	func push(_ screen: AppScreen) {
		path.append(screen)
	}

	func pop() {
		_ = path.popLast()
	}
}

extension NavigationManager: Navigatable {
	func showCharacterDetail(_ character: GOTCharacter) {
		push(.characterDetail(character))
	}
}



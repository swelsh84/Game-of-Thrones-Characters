//
//  ErrorHandler.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

protocol AppError: Error { }

protocol ErrorHandling {
	func handleError(_ error: AppError)
}

extension ErrorHandling {
	// Provide a default implementation to handle errors
	func handleError(_ error: AppError) {
		print("Error recorded: \(error)")
	}
}

enum GenericError: AppError {
	case unknown
}

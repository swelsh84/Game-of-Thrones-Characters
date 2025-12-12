//
//  Array+Extensions.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

extension Array where Element == String {
	func toRomanNumerals() -> String {
		if self.count == 1 {
			return self.map { $0.tvSeriesToRomanNumeral() }.joined()
		}
		return self.map { $0.tvSeriesToRomanNumeral() }.joined(separator: ", ")
	}
}


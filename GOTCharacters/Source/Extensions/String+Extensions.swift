//
//  String.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

extension String {
	func tvSeriesToRomanNumeral() -> String {
		let valueText = self.replacingOccurrences(of: "Season ", with: "")
		guard let singleValue = Int(valueText) else {
			return ""
		}
		switch singleValue {
		case 1: return "I"
		case 2: return "II"
		case 3: return "III"
		case 4: return "IV"
		case 5: return "V"
		case 6: return "VI"
		case 7: return "VII"
		case 8: return "VIII"
		default: return ""
		}
	}
}

//
//  Config.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

enum Config {
	static var bearerToken: String {
		return Bundle.main.object(forInfoDictionaryKey: "APIBearerToken") as? String ?? ""
	}
	static var baseURL: String {
		return Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
	}
}

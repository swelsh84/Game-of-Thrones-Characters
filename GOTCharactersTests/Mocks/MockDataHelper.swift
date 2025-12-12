//
//  MockDataHelper.swift
//  GOTCharactersTests
//
//  Created by Stu Welsh on 12/12/2025.
//

import Foundation

class MockDataHelper: NSObject {
	static var mockData: Data {
		let bundle = Bundle(for: Self.self)
		let url = bundle.url(forResource: "characters", withExtension: "json")!
		return try! Data(contentsOf: url)
	}
}

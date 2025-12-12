//
//  ErrorView.swift
//  GOTCharacters
//
//  Created by Stu Welsh on 12/12/2025.
//

import SwiftUI

struct ErrorView: View {
	let title: String
	let message: String
    var body: some View {
		VStack(spacing: 20) {
			Image(systemName: "xmark.circle")
				.font(.largeTitle)
				.foregroundStyle(Color.red)
			
			Text(title)

			Text(message)
		}
    }
}

#Preview {
    ErrorView(title: "There was an error", message: "Please try pull to refresh again")
}

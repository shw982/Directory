//
//  ErrorView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 11/03/24.
//

import SwiftUI

struct ErrorView: View {
    
    var body: some View {
        Image(uiImage: UIImage(named: Icons.errorMessage)!)
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaledToFit()
            .clipped()
            .accessibilityElement()
            .accessibilityLabel(Text("Error occurred image"))
            .accessibilityAddTraits(.isImage)
    }
}

#Preview {
    ErrorView()
}

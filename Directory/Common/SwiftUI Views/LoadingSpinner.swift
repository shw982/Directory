//
//  LoadingSpinner.swift
//  Directory
//
//  Created by Sweta Jaiswal on 08/03/24.
//

import SwiftUI

struct LoadingSpinner: View {
    
    let scaleFactor: CGFloat
  
    var body: some View {
        
        ProgressView()
            .progressViewStyle(.circular)
            .scaleEffect(scaleFactor, anchor: .center)
            .accessibilityElement()
            .accessibilityAddTraits(.updatesFrequently)
            .accessibilityLabel(Strings.Loading.Spinner.loading)
    }
}

#Preview {
    LoadingSpinner(scaleFactor: 1)
}

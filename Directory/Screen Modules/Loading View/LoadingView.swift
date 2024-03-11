//
//  LoadingView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import SwiftUI

struct LoadingView: View {
  
    var body: some View {
        VStack() {
            /// Progress Indicator
            LoadingSpinner(scaleFactor: Constants.loadingProgressViewScaleFactor)
                .padding(.bottom, UIDevice.iPad ? 60 : 30)
               
            /// Loading text
            Text(Strings.Loading.loading)
                .foregroundColor(Color.primary)
                .font(.custom(Fonts.Name.futura.rawValue, size: 40))
                .fontWeight(.medium)
        }
    }
}
 
#Preview {
    LoadingView()
}


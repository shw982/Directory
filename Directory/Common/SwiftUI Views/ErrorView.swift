//
//  ErrorView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 12/03/24.
//

import SwiftUI

struct ErrorView: View {
    
    let icon: String
    let message: String
    
    var body: some View {
        VStack(alignment: .center) {
            /// Icon
            Image(uiImage: UIImage(named: icon)!)
                .clipped()
            
            /// Message
            Text(message)
                .foregroundColor(Color.primary)
                .font(.custom(Fonts.Name.futura.rawValue, size: 22))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 30)
    }
}

#Preview {
    ErrorView(icon: "", message: "")
}

//
//  TextInfoView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 08/03/24.
//

import SwiftUI

struct RoomInfoView: View {
    var text: String
    var accessibilityLabel: String
    var accessibilityValue: String
    
    var body: some View {
        Text(text)
            .font(UIDevice.iPad ? .title2 : .subheadline)
            .foregroundColor(.gray)
            .accessibilityElement()
            .accessibilityLabel(Text(accessibilityLabel))
            .accessibilityValue(accessibilityValue)
            .accessibilityAddTraits(.isStaticText)
    }
}


#Preview {
    RoomInfoView(text: "",
                 accessibilityLabel: "",
                 accessibilityValue: "")
}

//
//  UnderlinedLabelView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 08/03/24.
//

import SwiftUI

struct UnderlinedLabelView: View {
    
    var title: String
    var accessibilityLabel: String
    
    var body: some View {
        Text(title)
            .underline()
            .font(UIDevice.iPad ? .title2 : .headline)
            .fontWeight(.semibold)
            .lineLimit(Constants.lineLimit)
            .minimumScaleFactor(Constants.lineLimitMinScaleFactor)
            .foregroundColor(.primary)
            .padding(.bottom, 20)
            .accessibilityElement()
            .accessibilityLabel(Text(accessibilityLabel))
            .accessibilityValue(title)
            .accessibilityAddTraits(.isStaticText)
    }
}

#Preview {
    UnderlinedLabelView(title: "", accessibilityLabel: "")
}

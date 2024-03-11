//
//  CircularImage.swift
//  Directory
//
//  Created by Sweta Jaiswal on 08/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct CircularImage: View {
    
    let contact: Contact
    let imageSize: CGFloat
    
    let borderWidth: CGFloat = 5
    let borderColor: Color = Color.init(hex: Colors.primaryColor)
  
    
    var body: some View {
        WebImage(url: URL(string: contact.avatar ?? ""))
            .resizable()
            .placeholder(Image(Icons.noImage))
            .indicator(.activity)
            .aspectRatio(contentMode: .fit)
            .frame(width: imageSize, height: imageSize)
            .clipped()
            .cornerRadius(imageSize/2 - borderWidth)
            .padding(borderWidth)
            .background(borderColor)
            .border(borderColor, width: borderWidth)
            .cornerRadius(imageSize/2)
            .accessibilityElement()
            .accessibilityLabel(Text("Person's image"))
            .accessibilityAddTraits(.isImage)
    }
}

#Preview {
    CircularImage(contact: Contact.contact1(), imageSize: 200)
}

//
//  ContactView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContactView: View {
    
    let contact: Contact
    
    let imageSize: CGFloat = UIDevice.iPad ? 150 : 100
    let textSpacing: CGFloat = UIDevice.iPad ? 15 : 5
    let horizontalPadding: CGFloat = UIDevice.iPad ? 50 : 0
    let hStackSpacing: CGFloat = UIDevice.iPad ? 20 : 10
  
    
    var body: some View {
        
        HStack (spacing: hStackSpacing) {
            /// Image
//            if let avatar = contact.avatar {
            WebImage(url: URL(string: contact.avatar ?? ""))
                    .resizable()
                    .placeholder(Image(Icons.noImage))
                    .indicator(.activity(style: .medium))
                    .transition(.fade)
                    .scaledToFit()
                    .frame(width: imageSize, height: imageSize)
                    .clipped()
                    .accessibilityElement()
                    .accessibilityLabel(Text("Person's image"))
                    .accessibilityAddTraits(.isImage)
//            }
            
            VStack(alignment: .leading, spacing: textSpacing) {
                
                /// Name
                if let firstName = contact.firstName, !firstName.isEmpty,
                   let lastName = contact.lastName, !lastName.isEmpty {
                    ContactListInfoView(title: (firstName + " " + lastName).capitalized,
                                       accessibilityLabel: "Name",
                                       accessibilityValue: firstName + " " + lastName)
                    .font(UIDevice.iPad ? .title2 : .headline)
                    .foregroundColor(.primary)
                }
                
                /// Job Title
                if let jobTitle = contact.jobtitle, !jobTitle.isEmpty {
                    ContactListInfoView(title: jobTitle.capitalized,
                                       accessibilityLabel: "Job Title",
                                       accessibilityValue: jobTitle)
                    .font(UIDevice.iPad ? .title2 : .subheadline)
                    .foregroundColor(.secondary)
                }
                
                /// Email
                if let email = contact.email, !email.isEmpty {
                    ContactListInfoView(title: email.lowercased(),
                                       accessibilityLabel: "Email",
                                       accessibilityValue: email)
                    .font(UIDevice.iPad ? .title3 : .footnote)
                    .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContactView(contact: Contact.contact1())
}


struct ContactListInfoView: View {
   
    var title: String
    var accessibilityLabel: String
    var accessibilityValue: String
    
    var body: some View {
        Text(title)
            .lineLimit(2)
            .minimumScaleFactor(Constants.lineLimitMinScaleFactor)
            .accessibilityElement()
            .accessibilityLabel(Text(accessibilityLabel))
            .accessibilityValue(accessibilityValue)
            .accessibilityAddTraits(.isStaticText)
    }
    
}

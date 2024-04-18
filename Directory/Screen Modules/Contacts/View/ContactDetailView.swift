//
//  ContactDetailView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import SwiftUI

struct ContactDetailView: View {
    
    @ObservedObject var viewModel = ContactListViewModel()
    
    let contact: Contact
    
    let bgHeight: CGFloat = UIDevice.iPad ? UIScreen.main.bounds.height * 0.23 : UIScreen.main.bounds.height * 0.25
    let imageSize: CGFloat = UIDevice.iPad ? UIScreen.main.bounds.width * 0.3 : UIScreen.main.bounds.width * 0.5
    
    var yOffset: CGFloat { (imageSize/2) + 30 }
    let textSpacing: CGFloat = UIDevice.iPad ? 15 : 10
    let vStackSpacing: CGFloat = UIDevice.iPad ? 60 : 20
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                /// Background Color
                LinearGradient(colors: [.red, .pink],
                               startPoint: .top, endPoint: .center)
                .frame(height: bgHeight)
                .opacity(0.5)
                
                /// User Avatar
                CircularImage(contact: contact, imageSize: imageSize)
                    .offset(y: -yOffset)
            }
            .padding(.bottom, 25)
            
            
            /// Details
            HStack {
                VStack(alignment: .leading, spacing: textSpacing) {
                    /// Name
                    if let firstName = contact.firstName, !firstName.isEmpty,
                       let lastName = contact.lastName, !lastName.isEmpty {
                        UnderlinedLabelView(title: firstName + " " + lastName, 
                                           accessibilityLabel: "Name")
                    }
                    /// ID
                    if let contactID = contact.id, !contactID.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.id,
                                   text: contactID.lowercased(),
                        accessibilityLabel: "ID",
                        accessibilityValue: contactID)
                    }
                    /// Email
                    if let email = contact.email, !email.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.email,
                                   text: email.lowercased(),
                                   accessibilityLabel: "Email",
                                   accessibilityValue: email)
                    }
                    /// Job Title
                    if let jobTitle = contact.jobtitle, !jobTitle.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.jobTitle,
                                   text: jobTitle.capitalized,
                                   accessibilityLabel: "Job Title",
                                   accessibilityValue: jobTitle)
                    }
                    /// Created At
                    if let createdAt = contact.createdAt, !createdAt.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.createdAt,
                                   text: createdAt.getFormattedDate(),
                                   accessibilityLabel: "Created At",
                                   accessibilityValue: createdAt.getFormattedDate())
                    }
                    /// Favourite Color
                    if let favouriteColor = contact.favouriteColor, !favouriteColor.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.favouriteColor,
                                   text: favouriteColor.capitalized,
                                   accessibilityLabel: "Favourite Color",
                                   accessibilityValue: favouriteColor)
                    }
                    /// Name
                    if let name = contact.name, !name.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.name,
                                   text: name.capitalized,
                                   accessibilityLabel: "Name",
                                   accessibilityValue: name)
                    }
                    /// To
                    if let to = contact.to, !to.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.to,
                                   text: to.capitalized,
                                   accessibilityLabel: "To",
                                   accessibilityValue: to)
                    }
                    /// From Name
                    if let fromName = contact.fromName, !fromName.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.from,
                                   text: fromName.capitalized,
                                   accessibilityLabel: "From name",
                                   accessibilityValue: fromName)
                    }
                    /// Type
                    if let type = contact.type, !type.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.type,
                                   text: type.capitalized,
                                   accessibilityLabel: "type",
                                   accessibilityValue: type)
                    }
                    /// Size
                    if let size = contact.size, !size.isEmpty {
                        DetailView(title: Strings.ContactList.ContactDetail.size,
                                   text: size.capitalized,
                                   accessibilityLabel: "Size",
                                   accessibilityValue: size)
                    }
                    /// Data
                    if let data = contact.data {
                        /// Data
                        UnderlinedLabelView(title: "Data", accessibilityLabel: "Data")
                            .padding(.top, 10)
                        /// ID
                        if let id = data.id, !id.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.id,
                                       text: id.capitalized,
                                       accessibilityLabel: "ID",
                                       accessibilityValue: id)
                        }
                        /// Title
                        if let title = data.title, !title.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.title,
                                       text: title.capitalized,
                                       accessibilityLabel: "Title",
                                       accessibilityValue: title)
                        }
                        /// Body
                        if let body = data.body, !body.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.body,
                                       text: body.capitalized,
                                       accessibilityLabel: "Body",
                                       accessibilityValue: body)
                        }
                        /// To ID
                        if let toID = data.toId, !toID.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.toID,
                                       text: toID.capitalized,
                                       accessibilityLabel: "To ID",
                                       accessibilityValue: toID)
                        }
                        /// From ID
                        if let fromID = data.fromId, !fromID.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.fromID,
                                       text: fromID.capitalized,
                                       accessibilityLabel: "From ID",
                                       accessibilityValue: fromID)
                        }
                        /// Meeting ID
                        if let meetingID = data.meetingid, !meetingID.isEmpty {
                            DetailView(title: Strings.ContactList.ContactDetail.Data.meetingID,
                                       text: meetingID.capitalized,
                                       accessibilityLabel: "Meeting ID",
                                       accessibilityValue: meetingID)
                        }
                    }
                }
                .offset(y: -yOffset)
                
                Spacer()
            }
            .padding(.horizontal, vStackSpacing)
            
            Spacer()
        }
    }
}


#Preview {
    ContactDetailView(contact: Contact.contact1())
}


struct DetailView: View {
    var title: String
    var text: String
    var accessibilityLabel: String
    var accessibilityValue: String
    
    let fontSize: CGFloat = UIDevice.iPad ? 26 : 17
    
    var body: some View {
        HStack {
            Text(title)
                .font(UIDevice.iPad ? .title : .headline)
            
            Text(text)
                .font(.custom(Fonts.Name.openSans.rawValue, size: fontSize))
                .lineLimit(Constants.lineLimit)
                .minimumScaleFactor(Constants.lineLimitMinScaleFactor)
        }
        .accessibilityElement()
        .accessibilityLabel(Text(accessibilityLabel))
        .accessibilityValue(accessibilityValue)
        .accessibilityAddTraits(.isStaticText)
    }
}


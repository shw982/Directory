//
//  ContactListView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import SwiftUI

struct ContactListView: View {
    
    /// Observes view model changes
    @ObservedObject var viewModel = ContactListViewModel()
    @State private var searchText = ""
    
    let horizontalPadding: CGFloat = UIDevice.iPad ? 50 : 0
  
    
    /// Filter contact list based on the search text
    var filteredContacts: [Contact] {
        if searchText.count == 0 {
            return viewModel.contactList
        } else {
            return viewModel.contactList.filter {
                if let firstName = $0.firstName {
                    return firstName.contains(searchText)
                }
                return false
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    /// Search bar
                    SearchBarView(searchText: $searchText)
                        .accessibilityElement()
                        .accessibilityLabel(Text("Search bar"))
                        .accessibilityAddTraits(.isSearchField)
                        .accessibilityHint("Tap to search contact")
                    
                    /// Contact list
                    List {
                        ForEach(filteredContacts) { contact in
                            NavigationLink {
                                /// When clicked on any contact, show detail view
                                ContactDetailView(contact: contact)
                            } label: {
                                /// Single contact row
                                ContactView(contact: contact)
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle(Strings.ContactList.navigationTitle)
                    .navigationBarTitleDisplayMode(.inline)
                }
                .padding(EdgeInsets(top: 0, leading: horizontalPadding,
                                    bottom: 0, trailing: horizontalPadding))
                
                /// Show loading indicator while fetching data
                LoadingSpinner(scaleFactor: Constants.progressViewScaleFactor)
                    .opacity((viewModel.contactList.count > 0 ||
                              viewModel.isErrorReceived) ? 0 : 1)
                  
                /// Show error view when unable to fetch data
                ErrorView()
                    .opacity(viewModel.isErrorReceived ? 1 : 0)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContactListView()
}

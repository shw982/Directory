//
//  RoomListView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import SwiftUI

struct RoomListView: View {
    
    /// Variables
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @ObservedObject var viewModel = RoomListViewModel()
    @State private var searchText = ""
    
    let horizontalPadding: CGFloat = UIDevice.iPad ? 50 : 0
    
    /// Filter room list based on the search text
    var filteredRooms: [Room] {
        if searchText.count == 0 {
            return viewModel.roomList
        } else {
            return viewModel.roomList.filter { ($0.id ?? "").contains(searchText) }
        }
    }
    
    var body: some View {
        
        NavigationView {
            if networkMonitor.isConnected {
                ZStack {
                    VStack {
                        /// Search bar
                        SearchBarView(searchText: $searchText)
                            .accessibilityElement()
                            .accessibilityLabel(Text("Search bar"))
                            .accessibilityAddTraits(.isSearchField)
                            .accessibilityHint("Tap to search room")
                        
                        /// Room list
                        List {
                            ForEach(filteredRooms) { room in
                                /// Single room row
                                RoomView(room: room, viewModel: viewModel)
                            }
                        }
                        .listStyle(PlainListStyle())
                        .navigationTitle(Strings.RoomList.navigationTitle)
                        .navigationBarTitleDisplayMode(.inline)
                        .keyboardType(.numberPad)
                    }
                    .padding(.horizontal, horizontalPadding)
                    
                    /// Show loading indicator while fetching data
                    LoadingSpinner(scaleFactor: Constants.progressViewScaleFactor)
                        .opacity((viewModel.roomList.count > 0 ||
                                  viewModel.isErrorReceived) ? 0 : 1)
                    
                    /// Show error view when unable to fetch data
                    ErrorView(icon: Icons.info, 
                              message: Strings.Error.noDataFound)
                        .opacity(viewModel.isErrorReceived ? 1 : 0)
                }
            } else {
                /// Show no network view when not connected to internet
                ErrorView(icon: Icons.noInternet, 
                          message: Strings.Error.noInternetMessage)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    RoomListView()
}

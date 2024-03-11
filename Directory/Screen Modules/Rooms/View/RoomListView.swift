//
//  RoomListView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import SwiftUI

struct RoomListView: View {
    
    /// Observes view model changes
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
                .padding(EdgeInsets(top: 0, 
                                    leading: horizontalPadding,
                                    bottom: 0, 
                                    trailing: horizontalPadding))
                
                /// Show loading indicator while fetching data
                LoadingSpinner(scaleFactor: Constants.progressViewScaleFactor)
                    .opacity((viewModel.roomList.count > 0 || 
                              viewModel.isErrorReceived) ? 0 : 1)
            }
            .alert(isPresented: $viewModel.isErrorReceived, content: {
                Alert(title: Text(Strings.Alert.title),
                      message: Text(Strings.Alert.message),
                      primaryButton: .cancel(),
                      secondaryButton: .default(Text(Strings.Alert.tryAgain)) {
                    viewModel.fetchRoomList()
                })
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    RoomListView()
}

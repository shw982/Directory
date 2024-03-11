//
//  HomeTabView.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import SwiftUI

enum Tabs: String {
    case contact = "Contact tab"
    case rooms = "Room tab"
}

struct HomeTabView: View {
    
    @State private var showSplash = true
    
    /// Used to show the default selected tab, indicated by tag
    @State private var defaultTab = Tabs.contact.rawValue
    @State private var selectedTab = Tabs.contact.rawValue
    
    var body: some View {
        
        ZStack {
            if showSplash {
                /// Splash screen
                LoadingView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5))
                
            } else {
                TabView(selection: $defaultTab) {
                    ContactListView()
                        .tabItem {
                            Text(Strings.Tab.contact)
                            Image(systemName: Icons.tabContact)
                        }
                        .tag(Tabs.contact.rawValue)
                    
                    RoomListView()
                        .tabItem {
                            Text(Strings.Tab.rooms)
                            Image(uiImage: UIImage(named: Icons.tabRooms)!)
                                .clipped()
                        }
                        .tag(Tabs.rooms.rawValue)
                }
                .accentColor(Color.init(hex: Colors.primaryColor))
                .onChange(of: defaultTab) { newValue in
                }
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.showSplash = false
                }
            }
        })
    }
}

#Preview {
    HomeTabView()
}

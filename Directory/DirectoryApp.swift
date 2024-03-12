//
//  DirectoryApp.swift
//  Directory
//
//  Created by Sweta Jaiswal on 08/03/24.
//

import Foundation
import SwiftUI

@main
struct DirectoryApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
                .environmentObject(networkMonitor)
        }
    }
}

//
//  NetworkMonitor.swift
//  Directory
//
//  Created by Sweta Jaiswal on 11/03/24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "monitor")
    var isConnected = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
    
}

//
//  ContactListViewModel.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation
import SwiftUI

class ContactListViewModel: ObservableObject {
    
    /// Variables
    @Published var contactList = [Contact]()
    @Published var isErrorReceived: Bool = false
    @Published var errorMessage: String?
    @Published var searchText = ""
    
    let service: APIServiceProtocol
    
    
    /// Initializer
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchContactList()
    }
    
    /// Get all contact list
    func fetchContactList() {
        service.fetchFromAPI([Contact].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let contactList):
                    self?.contactList = contactList
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.isErrorReceived = true
                }
            }
        }
    }
    
}


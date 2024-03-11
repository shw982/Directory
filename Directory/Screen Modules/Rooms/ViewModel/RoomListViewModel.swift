//
//  RoomListViewModel.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

class RoomListViewModel: ObservableObject {
    
    /// Variables
    @Published var roomList = [Room]()
    @Published var isErrorReceived: Bool = false
    @Published var errorMessage: String?
    
    let service: APIServiceProtocol
    
    /// Initializer
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchRoomList()
    }
    
    /// Get all room list
    func fetchRoomList() {
        service.fetchFromAPI([Room].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let rooms):
                    self?.roomList = rooms
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.isErrorReceived = true
                }
            }
        }
    }
    
    /// Format created at value
    func getRoomCreatedAt(_ createdAt: String) -> String {
        return createdAt.getFormattedDate()
    }
    
    /// Check if room is occupied
    func checkIfOccupied(_ room: Room) -> String {
        return room.isOccupied == true ? Strings.RoomList.RoomCell.yes : Strings.RoomList.RoomCell.no
    }
    
}

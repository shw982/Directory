//
//  Strings.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

enum Strings {
    
    struct Tab {
        static let contact = "Contact"
        static let rooms = "Rooms"
    }
    
    struct Loading {
        static let loading = "Loading..."
        
        struct Spinner {
            static let loading = "Loading information..."
        }
    }
    
    struct Search {
        static let placeholderText = "Search"
    }
    
    struct ContactList {
        static let navigationTitle = "Contact List"
        
        struct ContactDetail {
            static let email = "Email -"
            static let jobTitle = "Job Title -"
            static let createdAt = "Created At -"
            static let favouriteColor = "Favourite Color -"
            static let id = "ID -"
            static let name = "Name -"
            static let type = "Type -"
            static let size = "Size -"
            static let to = "To -"
            static let from = "From -"
            
            struct Data {
                static let title = "Title -"
                static let body = "Body -"
                static let id = "ID -"
                static let toID = "To ID -"
                static let fromID = "From ID -"
                static let meetingID = "Meeting ID -"
            }
        }
    }
    
    struct RoomList {
        static let navigationTitle = "Room List"
        static let searchRoomID = "Search Room ID"
        
        struct RoomCell {
            static let yes = "Yes"
            static let no = "No"
            static let roomID = "Room ID: "
            static let maxOccupancy = "Maximum Occupancy - "
            static let occupied = "Occupied - "
            static let createdAt = "Created At - "
        }
    }
    
    struct Error {
        static let noInternetMessage = "Network connection seems to be offline. Please check your connectivity."
        static let noDataFound = "Unable to show information. Please try again later."
    }
    
}

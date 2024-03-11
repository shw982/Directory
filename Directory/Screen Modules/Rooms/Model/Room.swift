//
//  Room.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

struct Room: Codable, Identifiable  {
    let createdAt: String?
    let isOccupied: Bool?
    let maxOccupancy: Int?
    let id: String?
    
    /// Example of a room
    static func room1() -> Room {
        return Room(createdAt: "2022-01-25T14:37:26.128Z",
                    isOccupied: false, 
                    maxOccupancy: 34071,
                    id: "1")
    }
}

//
//  Contact.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

struct Contact: Codable, Identifiable {
    let createdAt: String?
    let firstName: String?
    let avatar: String?
    let lastName: String?
    let email: String?
    let jobtitle: String?
    let favouriteColor: String?
    let id: String?
    let data: Data?
    let to: String?
    let fromName: String?
    let name: String?
    let type: String?
    let size: String?
    
    /// Example - 1
    static func contact1() -> Contact {
        return Contact(createdAt: "2022-01-24T17:02:23.729Z",
                       firstName: "Maggie",
                       avatar: "https://randomuser.me/api/portraits/women/21.jpg",
                       lastName: "Brekke",
                       email: "Crystel.Nicolas61@hotmail.com",
                       jobtitle: "Future Functionality Strategist",
                       favouriteColor: "Pink",
                       id: "1",
                       data: nil,
                       to: "e7uKbUb43UnVktIVvJXVsC:APA91bGHz-oI0Lrn5yeYkXD1IqkT9KPoVnqAxMmp1bt_jNy3p3HFW-8k-fXjDscq7wYZd-jZcVYvPlLeS2hg-EP-MzQ0Klo5RMZszdoO6eICrz_kJX23NjJK5V9dKPzJzgWAKi6a3ZqZ",
                       fromName: "Tina Thakare",
                       name: "John Doe",
                       type: "latte",
                       size: "medium")
    }
    
    /// Example - 2
    static func contact2() -> Contact {
        return Contact(createdAt: "2022-01-24T17:02:23.729Z",
                       firstName: "Maggie",
                       avatar: "https://randomuser.me/api/portraits/women/21.jpg",
                       lastName: "Brekke",
                       email: "Crystel.Nicolas61@hotmail.com",
                       jobtitle: "Future Functionality Strategist",
                       favouriteColor: "Pink",
                       id: "2",
                       data: nil,
                       to: nil,
                       fromName: nil,
                       name: "Johnny",
                       type: "Latte",
                       size: nil)
    }
}


struct Data: Codable, Identifiable {
    let title: String?
    let body: String?
    let id: String?
    let toId: String?
    let fromId: String?
    let meetingid: String?
}

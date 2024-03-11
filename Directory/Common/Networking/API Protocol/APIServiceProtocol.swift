//
//  APIServiceProtocol.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import Foundation

protocol APIServiceProtocol {
    
    func fetchContactList(completion: @escaping(Result<[Contact], APIErrors>) -> Void)
//    
//    func fetchRoomList(completion: @escaping(Result<[Room], APIErrors>) -> Void)
    
    func fetchFromAPI<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, APIErrors>) -> Void)
}

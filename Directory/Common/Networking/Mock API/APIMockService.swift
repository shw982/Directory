//
//  APIMockService.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import Foundation
@testable import Directory

enum JsonMockResponses: String {
    case contactList = "contact_list"
    case invalidContactList = "invalid_contact_list"
    case roomList = "room_list"
    case invalidRoomList = "invalid_room_list"
}

struct APIMockService: APIServiceProtocol {
    
    var contactResult: Result<[Contact], APIErrors>!
    var roomResult: Result<[Room], APIErrors>!
    var jsonFileName: String?
    
    /// Contact List
//    func fetchContactList(completion: @escaping (Result<[Contact], APIErrors>) -> Void) {
//        guard let filePath = Bundle.main.path(forResource: jsonFileName, ofType: "json") else {
//            completion(.failure(.jsonFileNotfound))
//            return
//        }
//        do {
//            let fileUrl = URL(fileURLWithPath: filePath)
//            let jsonData = try Data(contentsOf: fileUrl)
//            let decodedObject = try JSONDecoder().decode([Contact].self, from: jsonData)
//            completion(.success(decodedObject))
//        } catch {
//            return completion(.failure(APIErrors.parsing(error as? DecodingError)))
//        }
//    }
//    
//    
//    /// Valid room List
//    func fetchRoomList(completion: @escaping (Result<[Room], APIErrors>) -> Void) {
//        guard let filePath = Bundle.main.path(forResource: jsonFileName, ofType: "json") else {
//            completion(.failure(.jsonFileNotfound))
//            return
//        }
//        do {
//            let fileUrl = URL(fileURLWithPath: filePath)
//            let jsonData = try Data(contentsOf: fileUrl)
//            let decodedObject = try JSONDecoder().decode([Room].self, from: jsonData)
//            completion(.success(decodedObject))
//        } catch {
//            return completion(.failure(APIErrors.parsing(error as? DecodingError)))
//        }
//    }
    
    
    func fetchFromAPI<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, APIErrors>) -> Void) {

        guard let filePath = Bundle.main.path(forResource: jsonFileName, ofType: "json") else {
            completion(.failure(.jsonFileNotfound))
            return
        }
        do {
            let fileUrl = URL(fileURLWithPath: filePath)
            let jsonData = try Data(contentsOf: fileUrl)
            let decodedObject = try JSONDecoder().decode(T.self, from: jsonData)
            completion(.success(decodedObject))
        } catch {
            return completion(.failure(APIErrors.parsing(error as? DecodingError)))
        }
    }
    
}

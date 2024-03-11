//
//  APIService.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

struct APIService: APIServiceProtocol {
    

    //MARK: - Fetch contact list from  server
    
    func fetchContactList(completion: @escaping (Result<[Contact], APIErrors>) -> Void) {
        
        let urlRequest = APIRouter.getContactList.asURLRequest()
        
        URLSession.shared.dataTask(with: urlRequest) {(data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIErrors.url(error)))
                
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIErrors.badResponse(statusCode: response.statusCode)))
                
            } else {
                guard let data = data else {
                    completion(Result.failure(.unknown))
                    return
                }
                do {
                    let result = try JSONDecoder().decode([Contact].self, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIErrors.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    
    
    //MARK: - Fetch room list from server
    
    func fetchRoomList(completion: @escaping (Result<[Room], APIErrors>) -> Void) {
        
        let urlRequest = APIRouter.getRoomList.asURLRequest()
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIErrors.url(error)))
                
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIErrors.badResponse(statusCode: response.statusCode)))
                
            } else {
                guard let data = data else {
                    completion(Result.failure(APIErrors.unknown))
                    return
                }
                do {
                    let result = try JSONDecoder().decode([Room].self, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIErrors.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }
    
    
    func fetchFromAPI<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, APIErrors>) -> Void) {
        
        var urlRequest = APIRouter.getContactList.asURLRequest()

        if T.Type.self == [Room].self {
            urlRequest = APIRouter.getRoomList.asURLRequest()
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIErrors.url(error)))
                
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIErrors.badResponse(statusCode: response.statusCode)))
                
            } else {
                guard let data = data else {
                    completion(Result.failure(APIErrors.unknown))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIErrors.parsing(error as? DecodingError)))
                }
            }
        }
        .resume()
    }

}

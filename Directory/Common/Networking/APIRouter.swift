//
//  APIRouter.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

enum APIRouter {
    
    case getContactList
    case getRoomList
    
    private var properties: APIResource {
        switch self {
            
        case .getContactList:
            return .init(httpMethod: .get, apiVersion: .v1, endPoint: Endpoint.contact.rawValue)
            
        case .getRoomList:
            return .init(httpMethod: .get, apiVersion: .v1, endPoint: Endpoint.rooms.rawValue)
        }
    }
    
    private var accept: String {
        return "application/json"
    }
    
    func asURLRequest() -> URLRequest {
        let url = getURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = properties.httpMethod.rawValue
        urlRequest.setValue(accept, forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    private func getURL() -> URL {
        let properties = self.properties
        
        var url = Environment.baseUrl
        url.appendPathComponent(properties.apiVersion.rawValue)
        url.appendPathComponent(properties.endPoint)
        return url
    }
    
}

//
//  APIServiceProtocol.swift
//  Directory
//
//  Created by Sweta Jaiswal on 05/03/24.
//

import Foundation

protocol APIServiceProtocol {
    
    func fetchFromAPI<T: Decodable>(_ type: T.Type, completion: @escaping(Result<T, APIErrors>) -> Void)
}

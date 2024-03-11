//
//  APIResource.swift
//  Directory
//
//  Created by Sweta Jaiswal on 04/03/24.
//

import Foundation

struct APIResource {
    let httpMethod: HTTPMethod
    let apiVersion: APIVersion
    let endPoint: String
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum APIVersion: String {
    case v1 = "v1"
    case v2 = "v2"
}

//
//  APIResource.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
    var queryItems: [URLQueryItem] { get }
}
 
extension APIResource {
    var url: URL {
        var components = URLComponents(string: "https://api.themoviedb.org")!
        components.path = "/3\(methodPath)"
        var finalQueryItems = queryItems
        finalQueryItems.append(URLQueryItem(name: "api_key", value: "29a386e4a327f50a2016a8747c3985c5"))
        components.queryItems = finalQueryItems
        
        return components.url!
    }
    
    var queryItems: [URLQueryItem] { return [] }
}


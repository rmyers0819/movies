//
//  MoviesResource.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct MoviesResource: APIResource {
    var methodPath: String {
        return "discover/movie"
    }
    
    var filter: String?
    
    typealias ModelType = Movie
    
    
}

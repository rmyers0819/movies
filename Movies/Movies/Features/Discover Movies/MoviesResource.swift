//
//  MoviesResource.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct MoviesResource: APIResource {
    typealias ModelType = MoviesWrapper
    var methodPath: String {
        return "/discover/movie"
    }
    var queryItems = [URLQueryItem(name: "sort_by", value: "popularity.desc")]
}

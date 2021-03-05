//
//  DetailedMovieResource.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct DetailedMovieResource: APIResource {
    typealias ModelType = DetailedMovie
    var movieID: Int
    var methodPath: String {
      return "/movie/\(movieID)"
    }
}

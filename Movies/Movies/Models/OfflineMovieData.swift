//
//  OfflineMovieData.swift
//  Movies
//
//  Created by Robert Myers on 3/5/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct OfflineMovieData: Codable {
    let movies: [MovieViewModel]
    let date: Date
}

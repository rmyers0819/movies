//
//  DetailedMovie.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

// MARK: - DetailedMovie

struct DetailedMovie: Decodable {
    let adult: Bool?
    let homepage: String?
    let id: Int?
    let overview: String?
    let posterPath: String
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let title: String?
    let tagline: String?

    enum CodingKeys: String, CodingKey {
        case adult
        case homepage
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case title
        case tagline
    }
}


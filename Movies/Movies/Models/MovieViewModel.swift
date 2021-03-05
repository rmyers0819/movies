//
//  MoviesData.swift
//  Movies
//
//  Created by Robert Myers on 3/5/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct MovieViewModel: Identifiable {
    var id: Int
    var title: String
    var imageString: String?
    var tagLine: String?
    var overview: String
    var releaseDate: String?
    var audianceScore: String?
    var isAdultFilm: Bool
    var homePage: String?
    var reviews: [Review]
}

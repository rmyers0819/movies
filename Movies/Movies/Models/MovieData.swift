//
//  MoviesData.swift
//  Movies
//
//  Created by Robert Myers on 3/5/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct MovieViewModel: Identifiable {
    var id: Int { return movie.id }
    var movie: DiscoverMovie
    var movieDetails: DetailedMovie
    var reviews: [Review]
     
    var title: String {
        return movie.title
    }
    var imageString: String? {
        return movie.imageString
    }
    var tagLine: String? {
        return movieDetails.tagline
    }
    var overView: String? {
        return movie.overview
    }
    var releaseDate: String? {
        return movie.releaseDate
    }
    var audianceScore: String? {
        if let score = movie.voteAverage {
            return String(score)
        }
        return nil
    }
    var isAdultFilm: Bool {
        return movie.adult ?? false
    }
    var homePage: String? {
        return movieDetails.homepage
    }
    
    
    
}

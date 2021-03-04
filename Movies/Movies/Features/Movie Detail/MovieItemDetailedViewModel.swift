//
//  MovieItemDetailedViewModel.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

class MovieItemDetailedViewModel: ObservableObject {
    @Published var detailedMovie: DetailedMovie?
    
    var movieID: Int
    
    private var detailedMovieRequest: APIRequest<DetailedMovieResource>?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    func fetchMovieDetails() {
       let resource = DetailedMovieResource(movieID: movieID)
        let request = APIRequest(resource: resource)
        self.detailedMovieRequest = request
        request.execute { [weak self] detailedMovie in
            self?.detailedMovie = detailedMovie
        }
    }
}

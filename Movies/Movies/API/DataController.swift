//
//  DataController.swift
//  Movies
//
//  Created by Robert Myers on 3/5/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation
import SwiftUI

class DataController: ObservableObject {
    @Published var movies: [MovieData] = []
    
     func fetchData() {
        let request = APIRequest(resource: MoviesResource())
        let dispatchGroup = DispatchGroup()
        var movieData: [MovieData] = []
        var reviewsDict = [Int:[Review]]()
        dispatchGroup.enter()
        request.execute { moviesWrapper in
            moviesWrapper?.movies.forEach({ movie in
                // Get Movie Details for each movie on it's own thread.
                dispatchGroup.enter()
                APIRequest(resource: DetailedMovieResource(movieID: movie.id)).execute { movieDetails in
                    dispatchGroup.leave()
                    guard let movieDetails = movieDetails else { return }
                    movieData.append(MovieData(movie: movie, movieDetails: movieDetails, reviews: []))
                }
                // Get Movie Reviews for each movie on it's own thread.
                dispatchGroup.enter()
                APIRequest(resource: ReviewsResource(movieID: movie.id)).execute { wrappedReviews in
                    guard let reviews = wrappedReviews?.results else { dispatchGroup.leave(); return }
                    reviewsDict[movie.id] = reviews
                    dispatchGroup.leave()
                }
            })
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: DispatchQueue.global()) {
            var finalMovies: [MovieData] = []
            movieData.forEach { movieData in
                finalMovies.append(MovieData(movie: movieData.movie, movieDetails: movieData.movieDetails, reviews: reviewsDict[movieData.movie.id] ?? []))
            }
            self.movies = finalMovies
        }
    }
}

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
    @Published var movies: [MovieViewModel] = []
    // With the current API layer setup, it is necessary to keep a reference to each request sent, otherwise they will be deallocated before the response returns.
    private var moviesRequest: APIRequest<MoviesResource>?
    private var reviewRequests: [APIRequest<ReviewsResource>] = []
    private var detailsRequests: [APIRequest<DetailedMovieResource>] = []
     
    func fetchData() {
        moviesRequest = APIRequest(resource: MoviesResource())
        let dispatchGroup = DispatchGroup()
        var movieData: [MovieViewModel] = []
        var reviewsDict = [Int:[Review]]()
        dispatchGroup.enter()
        moviesRequest?.execute { [weak self] moviesWrapper in
            moviesWrapper?.movies.forEach({ [weak self] movie in
                // Get Movie Details for each movie on it's own thread.
                dispatchGroup.enter()
                let request = APIRequest(resource: DetailedMovieResource(movieID: movie.id))
                self?.detailsRequests.append(request)
                request.execute { movieDetails in
                    dispatchGroup.leave()
                    guard let movieDetails = movieDetails else { return }
                    movieData.append(MovieViewModel(movie: movie, movieDetails: movieDetails, reviews: []))
                }
                // Get Movie Reviews for each movie on it's own thread.
                dispatchGroup.enter()
                let reviewsRequest = APIRequest(resource: ReviewsResource(movieID: movie.id))
                self?.reviewRequests.append(reviewsRequest)
                reviewsRequest.execute { wrappedReviews in
                    guard let reviews = wrappedReviews?.results else { dispatchGroup.leave(); return }
                    reviewsDict[movie.id] = reviews
                    dispatchGroup.leave()
                }
            })
            dispatchGroup.leave()
        }
        
        // Perform final logic after all responses have returned or timed out
        dispatchGroup.notify(queue: DispatchQueue.global()) {
            var finalMovies: [MovieViewModel] = []
            movieData.forEach { movieData in
                finalMovies.append(MovieViewModel(movie: movieData.movie, movieDetails: movieData.movieDetails, reviews: reviewsDict[movieData.movie.id] ?? []))
            }
            DispatchQueue.main.async {
                self.movies = finalMovies
            }
            
        }
    }
}

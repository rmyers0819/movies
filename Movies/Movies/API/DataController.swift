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
    
    static let userDefaultsKey = "savedMovieData"
    
    func fetchData() {
        moviesRequest = APIRequest(resource: MoviesResource())
        let dispatchGroup = DispatchGroup()
        var discoverMovies: [DiscoverMovie] = []
        var detailedMovies: [DetailedMovie] = []
        var reviewsDict = [Int:[Review]]()
        dispatchGroup.enter()
        moviesRequest?.execute { [weak self] moviesWrapper in
            discoverMovies = moviesWrapper?.movies ?? []
            discoverMovies.forEach({ [weak self] movie in
                // Get Movie Details for each movie on it's own thread.
                dispatchGroup.enter()
                let request = APIRequest(resource: DetailedMovieResource(movieID: movie.id))
                self?.detailsRequests.append(request)
                request.execute { movieDetails in
                    dispatchGroup.leave()
                    guard let movieDetails = movieDetails else { return }
                    detailedMovies.append(movieDetails)
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
            discoverMovies.forEach { movie in
                guard let title = movie.title, let overView = movie.overview else { return }
                var audianceScore: String? = nil
                if let score = movie.voteAverage {
                    audianceScore = String(score)
                }
                let movieDetails = detailedMovies.first(where: { $0.id == movie.id })
                finalMovies.append(MovieViewModel(id: movie.id, title: title, imageString: movie.imageString, tagLine: movieDetails?.tagline, overview: overView, releaseDate: movie.releaseDate, audianceScore: audianceScore, isAdultFilm: movie.adult ?? false, homePage: movieDetails?.homepage, reviews: reviewsDict[movie.id] ?? []))
            }
            DispatchQueue.main.async {
                self.movies = finalMovies
            }
            
        }
    }
}

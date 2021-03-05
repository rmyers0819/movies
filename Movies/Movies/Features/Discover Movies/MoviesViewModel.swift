//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation
import SwiftUI

class MoviesViewModel: ObservableObject {
    @Published var movies: [DiscoverMovie] = []
    @Published var page: Int = 1
    @Published var isLoading: Bool = false
    
    private var moviesRequest: APIRequest<MoviesResource>?
    
    init(movies: [DiscoverMovie] = []) {
        self.movies = movies
    }
    
    func fetchInitialData() {
        // for testing and preview purposes, if we pass test data, we do not want to fetch data
        guard movies.isEmpty else { return }
        fetchMovies()
    }
    
    func fetchMovies() {
        guard !isLoading else { return }
        isLoading = true
        let request = APIRequest(resource: MoviesResource())
        self.moviesRequest = request
        request.execute { [weak self] movies in
            guard let wrapper = movies else { return }
            self?.movies = wrapper.movies
            self?.isLoading = false
        }
    }
}

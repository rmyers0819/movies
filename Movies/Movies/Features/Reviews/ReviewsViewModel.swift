//
//  ReviewsViewModel.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

class ReviewsViewModel: ObservableObject {
    
    @Published var reviews: [Review]?
    private let movieID: Int
    private var request: APIRequest<ReviewsResource>?
    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    func fetchReviews() {
        let request = APIRequest(resource: ReviewsResource(movieID: movieID))
        self.request = request
        request.execute { [weak self] wrappedReviews in
            self?.reviews = wrappedReviews?.results
        }
    }
}

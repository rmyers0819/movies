//
//  ReviewsResource.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct ReviewsResource: APIResource {
    typealias ModelType = WrappedReviews
    let movieID: Int
    var methodPath: String {
        return "/movie/\(String(movieID))/reviews"
    }
}

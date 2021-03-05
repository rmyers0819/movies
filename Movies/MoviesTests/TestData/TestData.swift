//
//  TestData.swift
//  MoviesTests
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

struct TestData {
    static var movies: [Movie] = {
        let url = Bundle.main.url(forResource: "Movies", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let wrapper = try! JSONDecoder().decode(MoviesWrapper.self, from: data)
        return wrapper.movies
    }()
    
    static var review: Review = {
        let url = Bundle.main.url(forResource: "Review", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(Review.self, from: data)
    }()
    
    static var reviews: [Review] = {
        let url = Bundle.main.url(forResource: "Reviews", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let wrapper = try! JSONDecoder().decode(WrappedReviews.self, from: data)
        return wrapper.results ?? []
    }()
}

//
//  DetailedMovie.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

// MARK: - DetailedMovie

struct DetailedMovie: Decodable {
    let adult: Bool?
//    let backdropPath: String
//    let budget: Int
//    let genres: [Genre]
    let homepage: String?
    let id: Int?
//    let imdbID, originalLanguage, originalTitle: String
    let overview: String?
//    let popularity: Double
    let posterPath: String
//    let productionCompanies: [ProductionCompany]
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
//    let status, tagline: String?
    let title: String?
//    let video: Bool
//    let voteAverage, voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
//        case backdropPath = "backdrop_path"
//        case budget, genres
        case homepage
        case id
//        case imdbID = "imdb_id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
        case overview
//        case popularity
        case posterPath = "poster_path"
//        case productionCompanies = "production_companies"
        case releaseDate = "release_date"
        case revenue, runtime
        case title
//        case status, tagline, title, video
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
    }
}

// MARK: - Genre

struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany

struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

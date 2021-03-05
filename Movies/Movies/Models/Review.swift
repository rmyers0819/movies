//
//  Review.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

// MARK: - WrappedReviews
struct WrappedReviews: Codable {
    let id, page: Int?
    let results: [Review]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case id, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.resultTask(with: url) { result, response, error in
//     if let result = result {
//       ...
//     }
//   }
//   task.resume()

// MARK: - Result
struct Review: Codable, Identifiable {
    let author: String?
    let authorDetails: AuthorDetails?
    let content, createdAt, id, updatedAt: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case createdAt = "created_at"
        case id
        case updatedAt = "updated_at"
        case url
    }
}

//
// To read values from URLs:
//
//   let task = URLSession.shared.authorDetailsTask(with: url) { authorDetails, response, error in
//     if let authorDetails = authorDetails {
//       ...
//     }
//   }
//   task.resume()

// MARK: - AuthorDetails
struct AuthorDetails: Codable {
    let name, username, avatarPath: String?
    let rating: Int?

    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}

//struct WrappedReviews: Decodable {
//    let id, page: Int?
//    let reviews: [Review]?
//    let totalPages, totalResults: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case id, page
//        case reviews = "results"
//        case totalPages = "total_pages"
//        case totalResults = "total_results"
//    }
//}
//
//struct Review: Decodable, Identifiable {
//    let author: String?
//    let authorDetails: AuthorDetails?
//    let content, createdAt, id, updatedAt: String?
//    let url: String?
//
//    enum CodingKeys: String, CodingKey {
//        case author
//        case authorDetails = "author_details"
//        case content
//        case createdAt = "created_at"
//        case id
//        case updatedAt = "updated_at"
//        case url
//    }
//}
//
//struct AuthorDetails: Codable {
//    let name, username, avatarPath: String?
//    let rating: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case name, username
//        case avatarPath = "avatar_path"
//        case rating
//    }
//}

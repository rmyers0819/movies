//
//  NetworkManager.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import Foundation

class NetworkManager {
    func load<T>(resource: Resource<T>, withCompletion completion: @escaping (T?) -> Void) {
        let task = URLSession.shared.dataTask(with: resource.url) { [weak self] (data, _ , _) -> Void in
            guard let data = data else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            // Use the Resource struct to parse data
        }
        task.resume()
    }
}

struct Resource<T> {
    let url: URL
    // Other properties and methods
}

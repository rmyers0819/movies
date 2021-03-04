//
//  MovieDetailView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct MovieItemDetailedView: View {
    var movie: Movie
    @ObservedObject var model: MovieItemDetailedViewModel
    
    init(movie: Movie) {
        self.movie = movie
        self.model = MovieItemDetailedViewModel(movieID: movie.id)
    }
    
    var body: some View {
        VStack {
            movie.imageString.map { imageString in
                ImageWithURL(imageString)
                    .frame(width: 200, height: 300, alignment: .center)
            }
            
        }
        .onAppear {
            self.model.fetchMovieDetails()
        }
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieItemDetailedView()
//    }
//}

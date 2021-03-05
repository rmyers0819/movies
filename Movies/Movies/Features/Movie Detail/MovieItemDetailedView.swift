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
    private var detailedMovie: DetailedMovie? {
        return model.detailedMovie
    }
    
    init(movie: Movie) {
        self.movie = movie
        self.model = MovieItemDetailedViewModel(movieID: movie.id)
    }
    
    var body: some View {
        detailedMovie.map { detailedMovie in
            VStack(spacing: 10) {
//                detailedMovie.title.map { title in
//                    Text(title)
//                        .font(.title)
//                }
                    
                movie.imageString.map { imageString in
                    ImageWithURL(imageString)
                        .frame(width: 200, height: 300, alignment: .top)
                }
                detailedMovie.overview.map { overview in
                    Text(overview)
                }
                detailedMovie.adult.map { _ in
                    Text("Restricted to 18 +")
                        .foregroundColor(.red)
                        .bold()
                }
                detailedMovie.homepage.map { url in
                    Link(url, destination: URL(string: url)!)
                }
//                detailedMovie.adult.map { isAdult in
//                    if isAdult {
//                        Text("Restricted to 18 +")
//                            .foregroundColor(.red)
//                            .bold()
//                    }
//                }
//
//                Text("Revenue: $\(detailedMovie.revenue) million")
                Spacer()
                NavigationLink(destination: ReviewsView(movieID: movie.id)) {
                    Text("See Reviews")
                        .fontWeight(.bold)
                        .font(.callout)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.purple, lineWidth: 5)
                        )
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
            }
            .padding(10)
        }

        .onAppear {
            self.model.fetchMovieDetails()
        }
        .navigationBarTitleDisplayMode(.inline)
//        .navigationBarHidden(true)
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieItemDetailedView()
//    }
//}

//
//  MovieDetailView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct MovieItemDetailedView: View {
    var movie: MovieViewModel
    
    @ObservedObject var model: MovieItemDetailedViewModel
    private var detailedMovie: DetailedMovie? {
        return model.detailedMovie
    }
    
    //    @ViewBuilder var reviewButton: some View {
    //
    //        return EmptyView()
    //    }
    
    init(movie: MovieViewModel) {
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
                
                if movie.isAdultFilm {
                    Text("Restricted to 18 +")
                        .foregroundColor(.red)
                        .bold()
                }
                
                detailedMovie.homepage.map { url in
                    Link(url, destination: URL(string: url)!)
                        .padding(.vertical, 10)
                }
                Spacer(minLength: 10)
                if !movie.reviews.isEmpty {
                    NavigationLink(destination: ReviewsView(reviews: movie.reviews)) {
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
                else {
                    Text("No Reviews Available")
                }
                Spacer()
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

//
//  ContentView.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    //@ObservedObject var model: MoviesViewModel
    @ObservedObject var dataController: DataController = DataController()
    var body: some View {
        NavigationView {
            List(dataController.movies) { movieData in
                let movie = movieData.movie
                NavigationLink(destination: MovieItemDetailedView(movie: movie)) {
                    MovieItemView(title: movie.title, overview: movie.overview, releaseDate: movie.releaseDate, audianceScore: String(movie.voteAverage), imageURL: movie.imageString)
                }
            }
            .navigationBarTitle("Movies")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                self.dataController.fetchData()
            }
        }
    }
}
//
//struct MoviesView_Previews: PreviewProvider {
//    static var previews: some View {
//        MoviesView(model: MoviesViewModel(movies: TestData.movies))
//    }
//}

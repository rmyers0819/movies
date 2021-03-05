//
//  ContentView.swift
//  Movies
//
//  Created by Robert Myers on 3/3/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var dataController: DataController = DataController()

    var body: some View {
        NavigationView {
            List(dataController.movies) { movie in
                
                NavigationLink(destination: MovieItemDetailedView(movie: movie)) {
                    MovieItemView(title: movie.title, overview: movie.tagLine ?? movie.overview, releaseDate: movie.releaseDate, audianceScore: movie.audianceScore, imageURL: movie.imageString)
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

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
    
    var body: some View {
        VStack(spacing: 10) {
            
            movie.imageString.map { imageString in
                ImageWithURL(imageString)
                    .frame(width: 200, height: 300, alignment: .top)
            }
            
            Text(movie.overview)
            
            if movie.isAdultFilm {
                Text("Restricted to 18 +")
                    .foregroundColor(.red)
                    .bold()
            }
            
            movie.homePage.map { url in
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
        
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieItemDetailedView()
//    }
//}

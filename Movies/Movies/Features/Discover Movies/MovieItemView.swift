//
//  MovieItemView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct MovieItemView: View {
    let title: String
    let overview: String
    let releaseDate: String?
    let audianceScore: String?
    let imageURL: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                imageURL.map { imageURL in
                    ImageWithURL(imageURL)
                        .frame(width: 100, height: 150, alignment: .center)
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                    Text(overview)
                        .font(.footnote)
                        .padding(.bottom, 10)
                    VStack(alignment: .leading) {
                        releaseDate.map { date in
                            HStack {
                                Text("Release Date:")
                                    .bold()
                                Text(date)
                            }
                        }
                        audianceScore.map { score in
                            HStack {
                                Text("Audiance Rating:")
                                    .bold()
                                Text(score)
                            }
                        }
                    }
                    .font(.subheadline)
                }
            }
        }
        
    }
}

struct MovieItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieItemView(title: "Tom & Jerry", overview: "Jerry moves into New York City's finest hotel on the eve of the wedding of the century, forcing the desperate event planner to hire Tom to get rid of him. As mayhem ensues, the escalating cat-and-mouse battle soon threatens to destroy her career, the wedding, and possibly the hotel itself.", releaseDate: "2021-02-12", audianceScore: "7.6", imageURL: "https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg")
    }
}

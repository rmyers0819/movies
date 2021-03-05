//
//  ReviewsView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct ReviewsView: View {
    var reviews: [Review]
    var body: some View {
        
        List(reviews) { review in
            ReviewsItemView(review: review)
        }
        .navigationBarTitle(reviews.count == 1 ? "1 Review" : "\(reviews.count) Reviews")
        .navigationBarTitleDisplayMode(.large)
    }
}

//struct ReviewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewsView()
//    }
//}

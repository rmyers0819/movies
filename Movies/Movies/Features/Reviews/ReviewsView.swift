//
//  ReviewsView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct ReviewsView: View {
    @ObservedObject var model: ReviewsViewModel
    private var reviews: [Review] {
        return model.reviews ?? []
    }
    init(movieID: Int) {
        self.model = ReviewsViewModel(movieID: movieID)
    }
    
    var body: some View {
        List(reviews) { review in
            ReviewsItemView(review: review)
        }
        .onAppear() {
            model.fetchReviews()
        }
    }
}

//struct ReviewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewsView()
//    }
//}

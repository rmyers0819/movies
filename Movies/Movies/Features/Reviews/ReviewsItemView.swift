//
//  ReviewsItemView.swift
//  Movies
//
//  Created by Robert Myers on 3/4/21.
//  Copyright © 2021 Robby Myers. All rights reserved.
//

import SwiftUI

struct ReviewsItemView: View {
    let review: Review
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            review.author.map { author in
                HStack {
                    Text("Reviewer Name:")
                        .bold()
                    Text(author)
                }
                
            }
            review.content.map { content in
                Text(content)
            }
        }
    }
}

struct ReviewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsItemView(review: TestData.review)
    }
}

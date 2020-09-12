//
//  BookRow.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct BookRow: View {
    var book: Book
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(book.title)
                Text(book.author)
            }
            .padding()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: BookData[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}



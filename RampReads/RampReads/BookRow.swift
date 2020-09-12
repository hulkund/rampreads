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

        VStack(alignment: .leading) {
            Text(book.title)
                .font(.headline)
            Text(book.author)
                .font(.subheadline)
        }
        .padding()

    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: bookData[0])
    }
}



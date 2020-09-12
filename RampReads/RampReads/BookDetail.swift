//
//  BookDetail.swift
//  RampReads
//
//  Created by Neha H on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    var book: Book
    var body: some View {

        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(book.title)
                        .font(.subheadline)
                    Spacer()
                }
                Text(book.author)
                    .font(.subheadline)
                Spacer()
                Text(String(book.rating))
            }
            .padding()
            Spacer()
        }
        .navigationBarTitle(Text(book.title), displayMode: .inline)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[0])
    }
}

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
        HStack{
            if book.isFavorite{
                Image(systemName: "star.fill")
                .imageScale(.medium)
                .foregroundColor(.yellow)
            }
            VStack(alignment: .leading) {
                Text(book.title)
                    .font(.headline)
                Text(book.author.first!)
                    .font(.subheadline)
            }
            
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(book: bookData[1])
    }
}



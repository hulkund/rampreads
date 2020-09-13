//
//  BookDetail.swift
//  RampReads
//
//  Created by Neha H on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct BookDetail: View {
    @EnvironmentObject var userData: UserData
    var book: Book
    var bookIndex: Int {
        userData.books.firstIndex(where: { $0.id == book.id })!
    }
    var body: some View {

        VStack {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Button(action: {
                        self.userData.books[self.bookIndex].isFavorite.toggle()
                    }) {
                        if self.userData.books[self.bookIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                    Text(book.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                Text(book.author.first)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Book Rating: " + String(book.rating))
                    .font(.headline)
                //replace with book.imageLink
                AsyncImage(
                           url: URL(string: "http://books.google.com/books/content?id=DuNtDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api")!
                            ,
                           placeholder: Text("Loading ...")
                )
                    .frame(width: 250.0, height: 400.0)
                Text(book.description).font(.body)
                Spacer()
            }
            .padding()
            
            Spacer()
        }
//        .navigationBarTitle(Text(book.title), displayMode: .inline)
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: bookData[0])
    }
}

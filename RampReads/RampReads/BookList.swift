//
//  BookList.swift
//  RampReads
//
//  Created by Neha H on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct BookList: View {
    @State var showFavoritesOnly = false
    var body: some View {
        NavigationView{
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(bookData) { book in
                    if !self.showFavoritesOnly || book.isFavorite {
                        NavigationLink(destination: BookDetail(book : book)) {
                            BookRow(book : book)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Reading List"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
        
    }
}



struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}

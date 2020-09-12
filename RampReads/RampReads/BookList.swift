//
//  BookList.swift
//  RampReads
//
//  Created by Neha H on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct BookList: View {
    var body: some View {
        NSLog("%@",bookData)
        return NavigationView{
            List(bookData) { book in NavigationLink (destination: BookDetail(book: book)) {
                BookRow(book: book)
                }
            }
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
        
    }
}



struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}

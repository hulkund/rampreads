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
        List {
            BookRow(book: BookData[0])
            BookRow(book: BookData[1])
        }
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList()
    }
}

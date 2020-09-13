//
//  BookSelection.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI
import Foundation
import Vision
import UIKit

struct BookSelection: View {
    @Binding var isPresented: Bool
    var userData: UserData
    var books: possibleData
    
    var body: some View {
        List{
            ForEach(books.possibleBooks) { book in
               Button(action: {
                    self.userData.books.append(book)
//                    self.books.possibleBooks.removeAll()
                    self.isPresented = false
                }) {
                    Text(book.title)
                        .font(.headline)
                }
                
            }
        }
    }
}


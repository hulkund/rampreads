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
    var userData: UserData
    var books: possibleData
    
    var body: some View {
        VStack{
            List{
                ForEach(books.possibleBooks) { book in
                   Button(action: {
                        self.userData.books.append(book)
                        self.books.possibleBooks.removeAll()
                        self.books.showingNewUserView = false
                    }) {
                        HStack{
                            Text(book.title)
                                .font(.headline)
                            Text(book.author.joined(separator: ", "))
                        }
                    }
                }
            }
        
        Button(action: {
            self.books.possibleBooks.removeAll()
            self.books.showingNewUserView = false
        }) {
            Text("Cancel")
        }.padding(.bottom, 20)
        }.padding(.vertical, 10)
    }
}



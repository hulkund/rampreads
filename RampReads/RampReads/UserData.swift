//
//  UserData.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var books = bookData
    
    func getNextID() -> String {
        var bookID = Int(books[books.count - 1].id)! + 1
        var match = true
        while match{
            match = false
            for book in books{
                if book.id == String(bookID){
                    match = true
                    bookID += 1
                }
            }
        }
        return String(bookID)
    }
}

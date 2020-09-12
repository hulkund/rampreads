//
//  Book.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Book: Hashable, Codable {
    var id: Int
    var title: String
    var author: String
    var rating: Double
    fileprivate var coverImageName: String
    var publishDate: String
    var publisher: String
    var genres: Array<Any>
    
}

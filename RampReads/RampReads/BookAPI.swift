//
//  BookAPI.swift
//  RampReads
//
//  Created by Neha H on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//
var APIKey = "AIzaSyCJrwcCX--7aHrz8LIfh0p9Bu7zPHT_sBE"
import Foundation

//let dispatchGroup = DispatchGroup()
import UIKit
func getBookFromTitle(searchTerm: String, possibleBooks: possibleData, userData: UserData) {
    var bookArray : [Book] = []
    
    //dispatchGroup.enter()
//    let searchTerm = "flowers+inauthor:keyes"
    let urlString = "https://www.googleapis.com/books/v1/volumes?q="+searchTerm+"&key="+APIKey
    print(urlString)
    if let url = URL(string: urlString)
    {
        print("Good URL")
        URLSession.shared.dataTask(with: url){ jsonData, res, err in
            if let jsonData = jsonData {
                print("Now to start JSON decoding..")
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(Welcome.self, from:jsonData) {
                    print("Decoded!")
                    var i = 0
                    for item in json.items {
                        if i < 5 {
                            i+=1
                            bookArray.append(Book(
                                id: "001",
                                title: item.volumeInfo.title,
                                author: item.volumeInfo.authors,
                                rating: -1.0,
                                description: item.volumeInfo.description ?? "",
                                publishDate: item.volumeInfo.publishedDate ?? "N/A",
                                publisher: item.volumeInfo.publisher ?? "N/A?",
                                genres: item.volumeInfo.categories ?? ["N/A"],
                                isFavorite: false,
                                pageCount: item.volumeInfo.pageCount ?? -1,
                                imageLink: item.volumeInfo.imageLinks.thumbnail ?? "http://books.google.com/books/content?id=2BMDuAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
                            ))
                        }
                    }

                        DispatchQueue.main.async {
//                            if possibleBooks.possibleBooks.count == 0{
                            userData.books.append(bookArray[0])
                            for book in bookArray{
                                possibleBooks.possibleBooks.append(book)
                            }
//                            }
                        }
                }
                else {
                    print("Bad Json Decoding")
                }
            }
        }.resume()
        print("finished")
    }
    else {
        print("Bad URL")
    }
    }

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
public struct Welcome: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [Item]
}

// MARK: - Item
public struct Item: Codable {
    let kind, id, etag: String
    let selfLink: String?
    let volumeInfo: VolumeInfo
}


// MARK: - VolumeInfo
public struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publisher, publishedDate: String?
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let imageLinks: ImageLinks
    let language: String?
    let previewLink: String?
    let description: String?
    enum CodingKeys: String, CodingKey {
        case title, authors, publisher, publishedDate
        case description, pageCount, printType, categories, maturityRating, allowAnonLogging, contentVersion,  imageLinks, language, previewLink
    }
}

// MARK: - ImageLinks
public struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}



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



public func getBookFromTitle(searchTerm: String){
    //dispatchGroup.enter()
//    let searchTerm = "flowers+inauthor:keyes"
    let urlString = "https://www.googleapis.com/books/v1/volumes?q="+searchTerm+"&key="+APIKey
    print(urlString)
    if let url = URL(string: urlString)
    {
        print("Good URL")
        URLSession.shared.dataTask(with: url){ data, res, err in
            if let data = data {
                print(data)
                print("Now to start JSON decoding..")
                //if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(Welcome.self, from:data) {
                    print("hello")
                    print(json.items[0].volumeInfo.title)
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
struct Welcome: Codable {
    let kind: String?
    let totalItems: Int?
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind, id, etag: String
    let selfLink: String?
    let volumeInfo: VolumeInfo
}


// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publisher, publishedDate, volumeInfoDescription: String
    let pageCount: Int?
    let printType: String?
    let categories: [String]?
    let maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion: String?
    let imageLinks: ImageLinks?
    let language: String?
    let previewLink: String?
    let infoLink, canonicalVolumeLink: String?
    enum CodingKeys: String, CodingKey {
        case title, authors, publisher, publishedDate
        case volumeInfoDescription = "description"
        case pageCount, printType, categories, maturityRating, allowAnonLogging, contentVersion,  imageLinks, language, previewLink, infoLink, canonicalVolumeLink
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String
}



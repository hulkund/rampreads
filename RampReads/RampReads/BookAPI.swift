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

public struct Response: Codable { // or Decodable
    var results:[Result]
}

public struct Result: Codable {
    var title: String
    var author: String
}
/**
public func viewDidLoad() {
    getBookFromTitle{ (json) in
        print("finished")
    }
    
    dispatchGroup.notify(queue: .main){
        print("all finished")
    }
}
 **/

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
                let decoder = JSONDecoder()
                print("Now to start JSON decoding..")
                if let json = try? JSONSerialization.jsonObject(with: data, options: []){
                    //completion(json)
                    print("Could decode JSON!")
                    print(json)
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

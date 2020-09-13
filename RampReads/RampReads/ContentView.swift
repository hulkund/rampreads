//
//  ContentView.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI
import UIKit



struct ContentView: View {
   let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!

    var body: some View {
//        let newImage = UIImage(contentsOfFile: "/Users/shobhita/lost_hero.jpg")
//        processImage(newImage!)
//        NSLog("DONE")
        return VStack {
            BookList().environmentObject(UserData())
        }
    
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
   
    var body: some View {
//        let newImage = UIImage(contentsOfFile: "/Users/shobhita/lost_hero.jpg")
//        processImage(newImage!)
//        NSLog("DONE")
    VStack {
            BookList().environmentObject(UserData())
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

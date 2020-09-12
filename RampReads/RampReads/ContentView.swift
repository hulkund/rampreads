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
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
//        let newImage = UIImage(contentsOfFile: "/Users/shobhita/lost_hero.jpg")
//        processImage(newImage!)
//        NSLog("DONE")
        return ZStack{
            VStack {
                BookList()
                Button(action: {
                    self.image = nil
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Take New Photo")
                        .font(.headline)
                }
                .padding(.all, 15.0)
                .background(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.015, brightness: 0.92)/*@END_MENU_TOKEN@*/)
            }
            .padding(.bottom, 20.0)
            
                if (showCaptureImageView) {
                  CaptureImageView(isShown: $showCaptureImageView, image: $image)
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

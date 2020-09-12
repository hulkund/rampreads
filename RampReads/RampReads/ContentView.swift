//
//  ContentView.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false

    var body: some View {
        ZStack{
            VStack {
                BookList()
                Button(action: {
                  self.showCaptureImageView.toggle()
                }) {
                    Text("Choose photos")
                }
                image?.resizable()
                     .frame(width: 250, height: 250)
                     .clipShape(Circle())
                     .overlay(Circle().stroke(Color.white, lineWidth: 4))
                     .shadow(radius: 10)
            }
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

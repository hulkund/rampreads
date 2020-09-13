//
//  BookList.swift
//  RampReads
//
//  Created by Neha H on 9/11/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI
import Foundation
import Vision
import UIKit


struct BookList: View {
    
    @EnvironmentObject var userData: UserData
    @State var image: UIImage? = nil
    @State var showCaptureImageView: Bool = false
    
    
    func newBook() -> Void {
        addNewBook(data: userData)
    }
    
    func delete(at offsets: IndexSet){
        self.userData.books.remove(atOffsets: offsets)
    }
    
    var body: some View {
        ZStack {
            VStack {
                NavigationView{
                    List {
                        Toggle(isOn: $userData.showFavoritesOnly) {
                            Text("Favorites only")
                        }
                        ForEach(userData.books) { book in
                            if !self.userData.showFavoritesOnly || book.isFavorite {
                                NavigationLink(destination: BookDetail(book : book)) {
                                    BookRow(book : book)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                        
                    }
                    .navigationBarTitle(Text("Reading List"))
                }.navigationViewStyle(DoubleColumnNavigationViewStyle())
                .padding()
                

                Button(action: {
                    self.image = nil
                    self.showCaptureImageView.toggle()
                }) {
                    Text("Take New Photo")
                        .font(.headline)
                }
                .padding(.all, 15.0)
                .background(/*@START_MENU_TOKEN@*/Color(hue: 1.0, saturation: 0.015, brightness: 0.92)/*@END_MENU_TOKEN@*/)
            }.padding(.bottom, 20.0)
            
                if (showCaptureImageView) {
                    CaptureImageView(isShown: $showCaptureImageView, image: $image, data: _userData)
                }
            
        }
    }
}



struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList().environmentObject(UserData())
    }
}

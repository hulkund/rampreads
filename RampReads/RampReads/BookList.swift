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

final class possibleData: ObservableObject  {
    @Published var processSearch: Bool = false
    @Published var searchTerm: String = ""
    @Published var possibleBooks: [Book] = []
    @Published var showingNewUserView : Bool = false
}

struct BookList: View {
    
    @EnvironmentObject var userData: UserData
    @State var image: UIImage? = nil
    @State var showCaptureImageView: Bool = false
    @State var showingNewUserView : Bool
    @EnvironmentObject var possibleBooks: possibleData
    
    func newBook() -> Void {
        addNewBook(data: userData)
    }
    
    func delete(at offsets: IndexSet){
        self.userData.books.remove(atOffsets: offsets)
    }
    
    var body: some View {
        if((possibleBooks.possibleBooks.count == 0)  && possibleBooks.processSearch) {
            getBookFromTitle(searchTerm: possibleBooks.searchTerm, possibleBooks: possibleBooks, userData: userData)
//            processSearch = false
        }
        if((possibleBooks.possibleBooks.count > 0) && possibleBooks.processSearch){
            NSLog("JSON PARSING WORKED")
            print(self.possibleBooks.possibleBooks)
//            self.userData.books.append(self.possibleBooks.possibleBooks[0])
            possibleBooks.showingNewUserView = true
            possibleBooks.processSearch = false
//            possibleBooks.possibleBooks.removeAll()
        }
        print(possibleBooks.showingNewUserView)
        if(possibleBooks.showingNewUserView){
            print(possibleBooks.showingNewUserView)
            print("TOGGLE WORKED (NOT REALLY THOUGH)")
        }
        return ZStack {
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
                
                Text("").sheet(isPresented: $possibleBooks.showingNewUserView) {
                    BookSelection(userData: self.userData, books: self.possibleBooks)
                }
                
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
                    CaptureImageView(isShown: $showCaptureImageView, image: $image, data: _userData, possibleData: _possibleBooks)
                }
            
        }
    }
}



struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(showingNewUserView: false).environmentObject(UserData()).environmentObject(possibleData())
    }
}

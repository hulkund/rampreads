//
//  Coordinator.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  @Binding var isCoordinatorShown: Bool
  @Binding var imageInCoordinator: UIImage?
  @Binding var searchTerm: String
  @Binding var doSearch: Bool
  @EnvironmentObject var data: UserData
    
    init(isShown: Binding<Bool>, image: Binding<UIImage?>, searchTerm: Binding<String>, doSearch: Binding<Bool>, data: EnvironmentObject<UserData>) {
    _isCoordinatorShown = isShown
    _imageInCoordinator = image
    _data = data
    _searchTerm = searchTerm
    _doSearch = doSearch
  }
    
  func imagePickerController(_ picker: UIImagePickerController,
                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
     imageInCoordinator = unwrapImage
     isCoordinatorShown = false
    let imageProcessor = ImageProcessor(userDataList: data, searchTerm: $searchTerm)
    var searchTerm = imageProcessor.processImage(image: unwrapImage)
    self.searchTerm = searchTerm
    self.doSearch = true
  }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     isCoordinatorShown = false
  }
}

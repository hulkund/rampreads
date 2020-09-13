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
  @EnvironmentObject var data: UserData
    
    init(isShown: Binding<Bool>, image: Binding<UIImage?>, data: EnvironmentObject<UserData>) {
    _isCoordinatorShown = isShown
    _imageInCoordinator = image
    _data = data
  }
    
  func imagePickerController(_ picker: UIImagePickerController,
                didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
     imageInCoordinator = unwrapImage
     isCoordinatorShown = false
    let imageProcessor = ImageProcessor(userDataList: data)
    imageProcessor.processImage(image: unwrapImage)
  }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
     isCoordinatorShown = false
  }
}

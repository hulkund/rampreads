//
//  CaptureImageView.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//
import SwiftUI
import Foundation
import UIKit
struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: UIImage?
    @EnvironmentObject var data: UserData
    @Binding var doNewSearch: Bool
    @Binding var searchTerm: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(isShown: $isShown, image: $image, searchTerm: $searchTerm, doSearch: $doNewSearch, data: _data)
    }
}

extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

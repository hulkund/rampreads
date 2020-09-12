//
//  TextExtraction.swift
//  RampReads
//
//  Created by Shobhita Sundaram on 9/12/20.
//  Copyright © 2020 Shobhita Sundaram. All rights reserved.
//

import Foundation
import Vision
import UIKit

//let CONFIDENCE_THRESHOLD = 0.6

var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)

private func configureOCR() {
    ocrRequest = VNRecognizeTextRequest { (request, error) in
        guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
        var ocrText = ""
        for observation in observations {
            let candidates = observation.topCandidates(5)

            guard let topCandidate = candidates.first else { return }
            print()
            print(topCandidate.string)
            print(topCandidate.confidence)
            print()
            if topCandidate.confidence >= 0.6{
                ocrText += topCandidate.string + " "
                print(topCandidate.string)
                print(topCandidate.confidence)
            }
           
        }
        print("OCR TEXT: " + ocrText)
//        let ocrTextWithoutSpaces = ocrText.replacingOccurrences(of: " ", with: "")
        let formattedOcrText = ocrText.lowercased().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if formattedOcrText != nil{
            let searchTerm = formattedOcrText!
            getBookFromTitle(searchTerm: searchTerm)

        } else {
            print("bad formattedOcrText")
        }
        
    }
    ocrRequest.recognitionLevel = .accurate
    ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
    ocrRequest.usesLanguageCorrection = true
}

public func processImage(_ image: UIImage) {
    guard let cgImage = image.cgImage else { return }
    configureOCR()
    let requestHandler = VNImageRequestHandler(cgImage: cgImage)
    
    do {
        try requestHandler.perform([ocrRequest])
    } catch let error {
        print(error)
    }

}

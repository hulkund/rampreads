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

var ocrRequest = VNRecognizeTextRequest(completionHandler: nil)

private func configureOCR() {
    ocrRequest = VNRecognizeTextRequest { (request, error) in
        guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
        ocrRequest.recognitionLevel = .accurate
        ocrRequest.recognitionLanguages = ["en-US", "en-GB"]
        ocrRequest.usesLanguageCorrection = true
            
        var ocrText = ""
        for observation in observations {
            let candidates = observation.topCandidates(5)

            guard let topCandidate = candidates.first else { return }
                    
            ocrText += topCandidate.string + " "
        }
        
        let formattedOcrText = ocrText.replacingOccurrences(of: " ", with: "%%20").lowercased()
        NSLog(formattedOcrText)
    }
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

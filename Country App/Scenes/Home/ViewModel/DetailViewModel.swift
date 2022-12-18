//
//  DetailViewModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 18.12.22.
//

import Foundation

class DetailViewModel {
    
    // MARK: Varibles

    var countryDetailResults = [CountryElement]()
    var successCallback : (()->())?
    var errorCallback : ((String)->())?
    
    func getCountryDetailResults(text : String) {
        DetailManager.shared.getDetailResponse(text : text) { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items {
                self.countryDetailResults = docs
                self.successCallback?()
            }
        }
    }
}

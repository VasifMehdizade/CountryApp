//
//  HomeViewModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 21.11.22.
//

import Foundation

class HomeViewModel {
    
    // MARK: Varibles

    var countryResults = [CountryElement]()
    var successCallback : (()->())?
    var errorCallback : ((String)->())?
    
    func getCountryResults() {
        HomePageManager.shared.getResponse { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items {
                self.countryResults = docs
                self.countryResults = self.countryResults.sorted(by: { $0.population ?? 0 > $1.population ?? 0})
                self.successCallback?()
            }
        }
    }
}

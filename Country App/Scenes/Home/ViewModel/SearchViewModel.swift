//
//  SearchViewModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 16.12.22.
//

import Foundation
import Alamofire

class SearchViewModel {
    
    var searchResults = [CountryElement]()
    var successCallback : (()->())?

    
    func searchResults(text : String) {
        guard let url = URL(string: "https://restcountries.com/v3.1/name/\(text)") else {return}
        AF.request(url, method: .get).responseData { response in
            do {
                let posts = try JSONDecoder().decode(([CountryElement].self), from: response.data ?? Data())
                self.searchResults = posts
            }
            catch {
                print("error: \(error.localizedDescription)")
            }
        }
    }
}


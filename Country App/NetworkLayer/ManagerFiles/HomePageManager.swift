//
//  HomePageManager.swift
//  Country App
//
//  Created by Vasif Mehdi on 02.12.22.
//

import Foundation


class HomePageManager {
    static let shared = HomePageManager()
    
    func getCountries (text : String, complete: @escaping ((Name?, String?)->())) {
        let url = "https://restcountries.com/v3.1/name/\(text)"
        NetworkManager.shared.requestWithoutBody(type: Name.self,
                                      url: url,
                                      method: .get) { response in
            switch response {
            case .success(let model) :
                complete(model, nil)
            case .failure(let error) :
                complete(nil, error.localizedDescription)
            }
        }
    }
}

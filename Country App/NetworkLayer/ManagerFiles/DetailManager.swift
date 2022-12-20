//
//  DetailManager.swift
//  Country App
//
//  Created by Vasif Mehdi on 18.12.22.
//

import Foundation


class DetailManager {
    static let shared = DetailManager()
    
    func getDetailResponse (text: String, complete: @escaping ((CountryElement?, String?)->())) {
        let url = "https://restcountries.com/v3.1/name/\(text)"
        NetworkManager.shared.request(type: CountryElement.self,
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

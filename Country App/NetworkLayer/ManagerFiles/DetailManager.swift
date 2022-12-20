//
//  DetailManager.swift
//  Country App
//
//  Created by Vasif Mehdi on 21.12.22.
//

import Foundation

//class DetailManager {
//    static let shared = DetailManager()
//    
//    func getDetailResponse (text: String, complete: @escaping (([DetailElement]?, String?)->())) {
//        let url = "https://restcountries.com/v3.1/name/\(text)"
//        NetworkManager.shared.request(type: [DetailElement].self,
//                                      url: url,
//                                      method: .get) { response in
//            switch response {
//            case .success(let model) :
//                complete(model, nil)
//            case .failure(let error) :
//                complete(nil, error.localizedDescription)
//            }
//        }
//    }
//}

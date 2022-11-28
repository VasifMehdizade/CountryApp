//
//  LoginManager.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import Foundation

class LoginManager {
    static let shared = LoginManager()
    
    func loginRequest (complete: @escaping ((LoginModel?, String?)->())) {
        let url = "http://faradheus-001-site1.itempurl.com/api/Account/login"
        NetworkManager.shared.request(type: LoginModel.self,
                                      url: url,
                                      method: .post) { response in
            switch response {
            case .success(let model) :
                complete(model, nil)
            case .failure(let error) :
                complete(nil, error.localizedDescription)
            }
        }
    }
}

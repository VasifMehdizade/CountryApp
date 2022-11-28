//
//  LoginViewModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 28.11.22.
//

import Foundation

class LoginViewModel {
    
    // MARK: Variables
    
    var loginMessages : LoginModel?
    
    var successCallback : (()->())?
    var errorCallback : ((String)->())?
    
    func loginSetup () {
        LoginManager.shared.loginRequest { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items {
                self.loginMessages = docs
                self.successCallback?()
            }
        }
    }
}

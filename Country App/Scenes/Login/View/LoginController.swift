//
//  LoginController.swift
//  Country App
//
//  Created by Vasif Mehdi on 15.11.22.
//

import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var orangeImageView: UIImageView!
    @IBOutlet weak var greenImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var register = RegisterController()
    var viewModel = LoginViewModel()
    
    var userMail = ""
    var userPassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleShapeImageView()
//        configurationViewModel()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
//        configurationViewModel()
        print(register.loginArray)
        
        if emailTextField.text == userMail && passwordTextField.text == userPassword {
                let controller = storyboard?.instantiateViewController(withIdentifier: "MainPageController") as! MainPageController
                navigationController?.show(controller, sender: nil)
            UserDefaults.standard.set(true, forKey: "isLoggedIn")

            }
        }
    
    @IBAction func notRegisteredButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        show(controller, sender: nil)
    }
    
    func configurationViewModel() {
//                showLoader()
        
        //        let body : [String : Any] = ["name" : "Vasif", "job": "engineer"]
        
        //        viewModel.loginSetup()
        //        NetworkManager.shared.getPosts(body: body)
        viewModel.errorCallback = { message in
            self.dismissLoader()
            self.showAlert(message: message) {}
        }
        
        viewModel.successCallback = {
            self.dismissLoader()
        }
    }
    
    func circleShapeImageView() {
        orangeImageView?.layer.masksToBounds = true
        orangeImageView?.layer.cornerRadius = orangeImageView.frame.height / 2
        
        greenImageView?.layer.masksToBounds = true
        greenImageView?.layer.cornerRadius = greenImageView.frame.height / 2
    }
}

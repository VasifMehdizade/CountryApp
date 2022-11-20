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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circleShapeImageView()
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
        
        @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        }
        
        @IBAction func signInButtonTapped(_ sender: Any) {
        }
        
        @IBAction func notRegisteredButtonTapped(_ sender: Any) {
            
            let controller = storyboard?.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
            navigationController?.show(controller, sender: nil)
        }
        
        func circleShapeImageView() {
            orangeImageView.layer.masksToBounds = true
            orangeImageView.layer.cornerRadius = orangeImageView.frame.height / 2
            
            greenImageView.layer.masksToBounds = true
            greenImageView.layer.cornerRadius = greenImageView.frame.height / 2
        }
    }

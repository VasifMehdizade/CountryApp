//
//  RegisterController.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var orangeImageView: UIImageView!
    @IBOutlet weak var createAccountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        circleShapeImageView()
    }
    @IBAction func signupButtonTapped(_ sender: Any) {
    }
    
    func circleShapeImageView() {
        orangeImageView.layer.masksToBounds = true
        orangeImageView.layer.cornerRadius = orangeImageView.frame.height / 2
    }
    

}

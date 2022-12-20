//
//  RegisterController.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import UIKit

class RegisterController: UIViewController {
    
    var loginArray = [UserModel]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var orangeImageView: UIImageView!
    var genders = ["male", "female" , "other"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
        
        circleShapeImageView()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let loginText = UserModel(name: nameTextField.text ?? "",
                                                        surname: surnameTextField.text ?? "",
                                                        username: usernameTextField.text ?? "",
                                                        password: passwordTextField.text ?? "",
                                                        confirmPassword: confirmPasswordTextField.text ?? "",
                                                        phone: phoneTextField.text ?? "" ,
                                                        email: emailTextField.text ?? "",
                                                        gender: genderTextField.text ?? "")
        
        loginArray.append(loginText)
        
        print(loginArray)
        
        for sth in loginArray{
            print(sth.name)
        }
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        
        controller.userMail = loginArray[0].email
        controller.userPassword = loginArray[0].password

        navigationController?.show(controller, sender: nil)
    }
    
    @IBAction func doYouHaveAlreadyAccountButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        navigationController?.show(controller, sender: nil)
    }
    
    func circleShapeImageView() {
        orangeImageView.layer.masksToBounds = true
        orangeImageView.layer.cornerRadius = orangeImageView.frame.height / 2
    }
    
}

extension RegisterController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genders[row]
        genderTextField.resignFirstResponder()
    }
}

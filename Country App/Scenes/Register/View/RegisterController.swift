//
//  RegisterController.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import UIKit

class RegisterController: UIViewController {

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
    
    func getBody() {
        let body : [String : Any] = ["name" : nameTextField.text ?? "",
                                     "surname": surnameTextField.text ?? "",
                                     "username" : usernameTextField.text ?? "",
                                     "password" : passwordTextField.text ?? "",
                                     "confirmPassword" : confirmPasswordTextField.text ?? "",
                                     "phone" : phoneTextField.text ?? "",
                                     "email" : emailTextField.text ?? "",
                                     "gender" : genderTextField.text ?? ""]
        
        print(body)
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        getBody()
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

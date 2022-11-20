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
    @IBOutlet weak var genderTextField: UITextField!
    
    var genders = ["male", "female" , "other"]
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        genderTextField.inputView = pickerView
        circleShapeImageView()
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        
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

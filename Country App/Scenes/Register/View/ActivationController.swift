//
//  ActivationController.swift
//  Country App
//
//  Created by Vasif Mehdi on 23.11.22.
//

import UIKit

class ActivationController: UIViewController {

    @IBOutlet weak var activationCodeTextField: UITextField!
    @IBOutlet weak var userIdTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func activateButtonTapped(_ sender: Any) {
            let controller = storyboard?.instantiateViewController(withIdentifier: "ActivationController") as! ActivationController
        navigationController?.show(controller, sender: nil)
    }
}

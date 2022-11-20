//
//  OnboardingController.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import UIKit

class OnboardingController: UIViewController {
    @IBOutlet weak var brandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let delay : Double = 1
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        fireTimer()
            
            
        }
        
        func fireTimer() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            show(controller, sender: nil)
        }
    }
}

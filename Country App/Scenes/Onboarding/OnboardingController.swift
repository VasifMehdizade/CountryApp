//
//  OnboardingController.swift
//  Country App
//
//  Created by Vasif Mehdi on 17.11.22.
//

import UIKit

class OnboardingController: UIViewController {
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var horizontalConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let delay : Double = 2
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            fireTimer()
        }
        
        func fireTimer() {
            let controller = storyboard?.instantiateViewController(withIdentifier: "LoginController") as! LoginController
            show(controller, sender: nil)
        }
        
        animationFunc()
        labelFontDesign()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    func animationFunc() {
        UILabel.animate(withDuration: 1) {
            self.horizontalConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func labelFontDesign() {
        brandLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        brandLabel.textColor = .orange
    }
}

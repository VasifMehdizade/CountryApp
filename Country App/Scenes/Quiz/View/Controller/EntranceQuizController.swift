//
//  EntranceQuizController.swift
//  Country App
//
//  Created by Vasif Mehdi on 21.01.23.
//

import UIKit

class EntranceQuizController: UIViewController {

    @IBOutlet weak var questionsButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func questionsButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "QuizController") as! QuizController
        self.navigationController?.show(controller, sender: nil)
    }
    
}

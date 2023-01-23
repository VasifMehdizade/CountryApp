//
//  QuizNumberCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizNumberCell: UICollectionViewCell {
    
    @IBOutlet weak var quizNumberButton: UIButton!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }

    @IBAction func quizNumberButtonTapped(_ sender: Any) {
    }
}


//"options": [
//    {
//        "optionOne": "yes",
//        "optionTwo": "no",
//        "optionThree": "good",
//        "optionFour": "ela",
//        "rightAnswer": "yes"
//    }
//]

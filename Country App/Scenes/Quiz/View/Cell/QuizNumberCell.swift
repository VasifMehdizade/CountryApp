//
//  QuizNumberCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizNumberCell: UICollectionViewCell {
    
    @IBOutlet weak var quizNumberLabel: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }

}

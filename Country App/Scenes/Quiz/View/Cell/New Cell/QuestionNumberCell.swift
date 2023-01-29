//
//  QuestionNumberCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 30.01.23.
//

import UIKit

class QuestionNumberCell: UICollectionViewCell {

    @IBOutlet weak var questionNumber: UILabel!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }

}

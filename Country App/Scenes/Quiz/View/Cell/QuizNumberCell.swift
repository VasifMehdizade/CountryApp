//
//  QuizNumberCell.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

protocol QuizNumberCellProtocol {
    func quizNumberButtonCalled(index: Int)
}

class QuizNumberCell: UICollectionViewCell {
    
    @IBOutlet weak var quizNumberButton: UIButton!
    
    var delegate : QuizNumberCellProtocol?
    
    @IBOutlet weak var questionLabel: UILabel!
    var index = 0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }

    @IBAction func quizNumberButtonTapped(_ sender: Any) {
        delegate?.quizNumberButtonCalled(index: index)
    }
}


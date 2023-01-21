//
//  QuizHeaderView.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizHeaderView: UICollectionReusableView {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        collectionView.register(UINib(nibName: "\(QuizNumberCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(QuizNumberCell.self)")
    }
    
}

extension QuizHeaderView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizNumberCell", for: indexPath) as! QuizNumberCell
        cell.quizNumberLabel.text = "2"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 48, height: 80)
    }
    
}

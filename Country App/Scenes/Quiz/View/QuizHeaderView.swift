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
        collectionView.register(UINib(nibName: "QuizNumberCell", bundle: nil), forCellWithReuseIdentifier: "QuizNumberCell")
    }
    
}

extension QuizHeaderView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuiznumberCell", for: indexPath) as! QuizNumberCell
        cell.quizNumberLabel.text = "2"
        return cell
    }
    
    
}

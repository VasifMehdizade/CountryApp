//
//  QuestionNumberHeaderView.swift
//  Country App
//
//  Created by Vasif Mehdi on 30.01.23.
//

import UIKit

class QuestionNumberHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var questionModel = [Questions]()
    var sendingNumber : ((String)->())?
    
    override func layoutSubviews() {
        collectionView.register(UINib(nibName: "QuestionNumberCell", bundle: nil), forCellWithReuseIdentifier: "QuestionNumberCell")
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Questions", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                questionModel = try JSONDecoder().decode([Questions].self, from: data)
                collectionView.reloadData()
            }
            catch {
                print(error)
            }
        }
        else{
        }
    }
    
}

extension QuestionNumberHeaderView : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionNumberCell", for: indexPath) as! QuestionNumberCell
        cell.questionNumber.text = questionModel[indexPath.row].questionNumber
        return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 48, height: 76)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sendingNumber?(questionModel[indexPath.row].questionNumber)
        print(questionModel[indexPath.row].questionNumber)
    }
    
    
}

//
//  QuestionListController.swift
//  Country App
//
//  Created by Vasif Mehdi on 30.01.23.
//

import UIKit

class QuestionListController: UIViewController {
    
    var questionModel = [Questions]()
    var questionNumber = ""


    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        registerCollectionView()
        jsonSetup()

    }
    func registerCell() {
        collectionView.register(UINib(nibName: "\(QuestionCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(QuestionCollectionViewCell.self)")
    }
    
    func registerCollectionView () {
        collectionView.register(UINib(nibName: "\(QuestionNumberHeaderView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(QuestionNumberHeaderView.self)")
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
extension QuestionListController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionCollectionViewCell", for: indexPath) as! QuestionCollectionViewCell
        for number in questionModel{
            if number.questionNumber == questionNumber{
                cell.questionLabel.text = number.question
                cell.optionOneButton.setTitle("\(number.optionOne)", for: .normal)
                cell.optionTwoButton.setTitle("\(number.optionTwo)", for: .normal)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(QuestionNumberHeaderView.self)", for: indexPath) as! QuestionNumberHeaderView
            headerView.jsonSetup()
            headerView.sendingNumber = { number in
                self.questionNumber = number
                self.collectionView.reloadData()
            }
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
}

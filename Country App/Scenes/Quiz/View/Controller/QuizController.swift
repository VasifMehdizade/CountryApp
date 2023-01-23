//
//  QuizController.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizController: UIViewController {
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = QuizViewModel()
    var questionModel = [Questions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        registerCell()
        jsonSetup()
        findModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func exitButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func registerCollectionView () {
        collectionView.register(UINib(nibName: "\(QuizHeaderView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(QuizHeaderView.self)")
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
    
    
    func registerCell() {
        collectionView.register(UINib(nibName: "\(QuizCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(QuizCollectionViewCell.self)")
    }
    
    func findModel (){
        for num in questionModel {
            if num.questionNumber == 1{
                print("sad,sdjnfzads,nf,sadnf,samdnf,amsdnf")
            }
        }
    }
    
}

extension QuizController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizCollectionViewCell", for: indexPath) as! QuizCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(QuizHeaderView.self)", for: indexPath) as! QuizHeaderView
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 120)
    }
    
}

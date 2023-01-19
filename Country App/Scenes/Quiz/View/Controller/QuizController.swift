//
//  QuizController.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func registerCollectionView () {
        collectionView.register(UINib(nibName: "\(QuizHeaderView.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(QuizHeaderView.self)")
    }
    
    func registerCell() {
        collectionView.register(UINib(nibName: "QuizNumberCell", bundle: nil), forCellWithReuseIdentifier: "QuizNumberCell")
    }
    
}

extension QuizController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizNumberCell", for: indexPath) as! QuizNumberCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(QuizHeaderView.self)", for: indexPath) as! QuizHeaderView
            
//            headerView.viewModel.getMyList {
//                for num in headerView.viewModel.items {
//                    if num.movieId == self.movieId {
//                        headerView.bookmarkIcon.setImage(UIImage(named: "bookmarkRed"), for: .normal)
//                    }
//                }
//            }
                
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    
}

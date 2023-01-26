//
//  QuizController.swift
//  Country App
//
//  Created by Vasif Mehdi on 19.01.23.
//

import UIKit

class QuizController: UIViewController {
    
    @IBOutlet weak var optionFour: UIButton!
    @IBOutlet weak var optionThree: UIButton!
    @IBOutlet weak var optionTwo: UIButton!
    @IBOutlet weak var optionOne: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = QuizViewModel()
    var questionModel = [Questions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        jsonSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func exitButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func optionOneTapped(_ sender: Any) {
    }
    
    @IBAction func optionTwoTapped(_ sender: Any) {
    }
    @IBAction func optionThreeTapped(_ sender: Any) {
    }
    @IBAction func optionFourTapped(_ sender: Any) {
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
        collectionView.register(UINib(nibName: "\(QuizNumberCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(QuizNumberCell.self)")
    }
    
}

extension QuizController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuizNumberCell", for: indexPath) as! QuizNumberCell
        cell.delegate = self
        cell.index = indexPath.row
        let data = questionModel[indexPath.row]
        cell.questionLabel.text = data.questionNumber
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3 - 48, height: 76)
    }
    
}

extension QuizController: QuizNumberCellProtocol {
    func quizNumberButtonCalled(index: Int) {
        let data = questionModel[index]
        questionLabel.text = data.question
        optionOne.setTitle("\(data.optionOne)", for: .normal)
        optionTwo.setTitle("\(data.optionTwo)", for: .normal)
        optionThree.setTitle("\(data.optionThree)", for: .normal)
        optionFour.setTitle("\(data.optionFour)", for: .normal)
    }
    
}

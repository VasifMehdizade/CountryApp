//
//  QuizViewModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 23.01.23.
//

import UIKit

class QuizViewModel: UIViewController {
    
    var questionModel = [Questions]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonSetup()
    }
    
    func jsonSetup() {
        if let jsonFile = Bundle.main.url(forResource: "Questions", withExtension: "json"), let data = try? Data(contentsOf: jsonFile) {
            do {
                questionModel = try JSONDecoder().decode([Questions].self, from: data)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        else{
        }
    }
    
}

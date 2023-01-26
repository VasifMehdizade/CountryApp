//
//  QuestionsModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 23.01.23.
//

import Foundation

struct Questions: Codable {
    let question : String
    let questionNumber : String
    let optionOne : String
    let optionTwo : String
    let optionThree : String
    let optionFour : String
    let rightAnswer : String
}


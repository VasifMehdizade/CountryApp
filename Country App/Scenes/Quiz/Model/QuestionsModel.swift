//
//  QuestionsModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 23.01.23.
//

import Foundation

struct Questions: Codable {
    let question : String
    let questionNumber : Int
    let optionOne : String
    let optionTwo : String
    let optionThree : String
    let optionFour : String
    let rightAnswer : String
    //    let options : [Options]
}

//struct Options: Codable {
//    let optionsOne : String
//    let optionsTwo : String
//    let optionsThree : String
//    let optionsFour : String
//    let rightOptions : String
//}

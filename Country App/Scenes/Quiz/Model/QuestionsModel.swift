//
//  QuestionsModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 23.01.23.
//

import Foundation

struct Questions {
    let question : String
    let questionNumber : Int
    let optios : [Options]
}

struct Options {
    let optionsOne : String
    let optionsTwo : String
    let optionsThree : String
    let optionsFour : String
    let rightOptions : String
}

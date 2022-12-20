//
//  DetailModel.swift
//  Country App
//
//  Created by Vasif Mehdi on 20.12.22.
//

import Foundation


// MARK: - DetailElement
struct DetailElement: Codable {
    let name: Names
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let cioc: String
    let independent: Bool
    let status: String
    let unMember: Bool
//    let currencies: Currenciess
    let idd: Idds
    let capital, altSpellings: [String]
    let region, subregion: String
//    let languages: Languages
    let translations: [String: Translations]
    let latlng: [Int]
    let landlocked: Bool
    let borders: [String]
    let area: Int
    let demonyms: Demonymss
    let flag: String
    let maps: Mapss
    let population: Int
//    let gini: Gini
    let fifa: String
    let car: Cars
    let timezones, continents: [String]
    let flags, coatOfArms: CoatOfArmss
    let startOfWeek: String
    let capitalInfo: CapitalInfos
    let postalCode: PostalCodes
}

// MARK: - CapitalInfo
struct CapitalInfos: Codable {
    let latlng: [Double]
}

// MARK: - Car
struct Cars: Codable {
    let signs: [String]
    let side: String
}

// MARK: - CoatOfArms
struct CoatOfArmss: Codable {
    let png: String
    let svg: String
}

// MARK: - Currencies
//struct Currenciess: Codable {
//    let bdt: Bdt
//
//    enum CodingKeys: String, CodingKey {
//        case bdt = "BDT"
//    }
//}

//// MARK: - Bdt
//struct Bdt: Codable {
//    let name, symbol: String
//}

// MARK: - Demonyms
struct Demonymss: Codable {
    let eng, fra: Engs
}

// MARK: - Eng
struct Engs: Codable {
    let f, m: String
}

// MARK: - Gini
//struct Gini: Codable {
//    let the2016: Double
//
//    enum CodingKeys: String, CodingKey {
//        case the2016 = "2016"
//    }
//}

// MARK: - Idd
struct Idds: Codable {
    let root: String
    let suffixes: [String]
}

// MARK: - Languages
//struct Languages: Codable {
//    let ben: String
//}

// MARK: - Maps
struct Mapss: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Names: Codable {
    let common, official: String
//    let nativeName: NativeNames
}

// MARK: - NativeName
//struct NativeNames: Codable {
//    let bens: Translations
//}

// MARK: - Translation
struct Translations: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCodes: Codable {
    let format, regex: String
}



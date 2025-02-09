//
//  Countrie.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 15/12/2567 BE.
//

import Foundation

// MARK: - Welcome
struct Country: Decodable, Hashable {
    let name: Name
    let tld: [String]?
    let cca2: String?
    let ccn3: String?
    let cca3: String?
    let cioc: String?
    let independent: Bool?
    let status: String?
    let unMember: Bool?
    let currencies: [String:Currencies]?
    let idd: Idd?
    let capital: [String]?
    let altSpellings: [String]?
    let region: String
    let subregion: String?
    let languages: [String:String]?
    let translations: [String: OfficialCommon]?
    let latlng: [Double]?
    let landlocked: Bool?
    let borders: [String]?
    let area: Double?
    let demonyms: [String:Demonyms]?
    let flag: String?
    let maps: Maps?
    let population: Int
    let fifa: String?
    let car: Car?
    let timezones: [String]?
    let continents: [String]?
    let flags: Flags
    let coatOfArms: CoatOfArms?
    let startOfWeek: String?
    let capitalInfo: CapitalInfo?
    let postalCode: PostalCode?
}

extension Country {
    struct Name: Decodable, Hashable {
        let common: String?
        let official: String?
        let nativeName: [String: OfficialCommon]?
    }
    
    struct OfficialCommon: Decodable, Hashable {
        let official: String?
        let common: String?
    }
    
    struct Currencies: Decodable, Hashable {
        let name: String
        let symbol: String
    }
    
    struct Idd: Decodable, Hashable {
        let root: String?
        let suffixes: [String]?
    }
    
    struct Demonyms: Decodable, Hashable {
        let m: String
        let f: String
    }
    
    struct Maps: Decodable, Hashable {
        let googleMaps: String
        let openStreetMaps: String
    }
    
    struct Car: Decodable, Hashable {
        let signs: [String]?
        let side: String
    }
    
    struct Flags: Decodable, Hashable {
        let png: String
        let alt: String?
    }
    
    struct CoatOfArms: Decodable, Hashable {
        let png: String?
    }
    
    struct CapitalInfo: Decodable, Hashable {
        let latlng: [Double]?
    }
    
    struct PostalCode: Decodable, Hashable {
        let format: String
        let regex: String?
    }
}


//
//struct Country: Decodable {
//    let name: Name
//    let tld: [String]?
//    let cca2: String
//    let ccn3: String?
//    let cca3: String
//    let cioc: String?
//    let independent: Bool?
//    let status: String?
//    let unMember: Bool
//    let currencies: [String:Currencies]?
//    let idd: Idd?
//    let capital: [String]?
//    let altSpellings: [String]
//    let region: String
//    let subregion: String?
//    let languages: [String:String]?
//    let translations: [String: OfficialCommon]
//    let latlng: [Double]
//    let landlocked: Bool
//    let borders: [String]?
//    let area: Double
//    let demonyms: [String:Demonyms]?
//    let flag: String
//    let maps: Maps
//    let population: Int
//    let fifa: String?
//    let car: Car
//    let timezones: [String]
//    let continents: [String]
//    let flags: Flags
//    let coatOfArms: CoatOfArms
//    let startOfWeek: String
//    let capitalInfo: CapitalInfo
//    let postalCode: PostalCode?
//}

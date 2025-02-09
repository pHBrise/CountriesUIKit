//
//  CountriesAPI.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 15/12/2567 BE.
//

enum CountriesAPI: APICall {
    case countries
    case country(String)
}

extension CountriesAPI: Decodable {
    var baseURL: String {
        return "https://restcountries.com/v3.1"
    }
    
    var method: HTTPMethod {
        switch self {
        case .countries:
            return .get
        case .country(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .countries:
            return "/independent?status=true&fields=name,region,flags,population"
        case .country(let country):
            return "/name/\(country)"
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
}

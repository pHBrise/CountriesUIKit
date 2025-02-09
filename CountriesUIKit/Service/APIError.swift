//
//  APIError.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 31/12/2567 BE.
//

import Foundation

typealias HTTPCode = Int
typealias HTTPCodes = Range<HTTPCode>

extension HTTPCodes {
    static let success = 200 ..< 300
}

enum APIError: Swift.Error {
    case invalidURL
    case invalidResponse
    case httpCode(HTTPCode)
    case invalidData
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .httpCode(code): return "Unexpected HTTP code: \(code)"
        case .invalidResponse: return "Invalid response from the server"
        case .invalidData: return "Invalid Data from the server"
        }
    }
}



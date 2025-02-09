//
//  APICall.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 15/12/2567 BE.
//
import Foundation

protocol APICall {
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: [String: String] { get }
    
}

extension APICall {
    func urlRequest() -> Result<URLRequest, Error> {
        guard let url = URL(string: baseURL + path) else {
            return .failure(APIError.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return .success(request)
    }
}

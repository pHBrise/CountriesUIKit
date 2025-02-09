//
//  CountriesService.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 15/12/2567 BE.
//

import Foundation

protocol ServiceProtocol {
    func call<Value: Decodable>(endpoint: APICall, completion: @escaping (Result<Value, Error>) -> Void)
}


class Service: ServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func call<Value: Decodable>(endpoint: APICall, completion: @escaping (Result<Value, Error>) -> Void) {

        switch endpoint.urlRequest() {
        case .success(let urlRequest):
            session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, !(HTTPCodes.success.contains(httpResponse.statusCode)) {
                    completion(.failure(APIError.httpCode(httpResponse.statusCode)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(APIError.invalidData))
                    return
                }
                
                do {
                    let decodedResponse = try JSONDecoder().decode(Value.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        case .failure(let failure):
            completion(.failure(failure))
        }
    }
}

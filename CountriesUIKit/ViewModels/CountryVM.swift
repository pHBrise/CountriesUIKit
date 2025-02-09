//
//  CountryVM.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 21/12/2567 BE.
//

class CountryVM {
    private let service: ServiceProtocol
    private(set) var country: Country?
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func searchCountry(by name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = CountriesAPI.country(name)
        service.call(endpoint: endpoint) { [weak self] (result: Result<[Country], Error>) in
            switch result {
            case .success(let country):
                self?.country = country.first
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

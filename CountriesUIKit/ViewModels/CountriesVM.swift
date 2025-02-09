//
//  CountriesVM.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 15/12/2567 BE.
//

class CountriesVM {
    private let service: ServiceProtocol
    private(set) var countries: [Country] = []
    private(set) var groupedCountries: [String: [Country]] = [:]
    private(set) var regions: [String] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }

    func loadCountries(completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = CountriesAPI.countries
        service.call(endpoint: endpoint) { [weak self] (result: Result<[Country], Error>) in
            switch result {
            case .success(let countries):
                self?.countries = countries
                self?.groupCountriesByRegion()
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func searchCountry(by name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = CountriesAPI.country(name)
        service.call(endpoint: endpoint) { [weak self] (result: Result<[Country], Error>) in
            switch result {
            case .success(let countries):
                self?.countries = countries
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func groupCountriesByRegion() {
            groupedCountries = Dictionary(grouping: countries, by: { $0.region })
            regions = groupedCountries.keys.sorted()
    }
}

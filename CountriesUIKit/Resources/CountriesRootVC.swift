//
//  CountriesRootVC.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 14/12/2567 BE.
//

import UIKit

class CountriesRootVC {
    static func setupListCountriesNC() -> UINavigationController {
        let service = Service()
        let viewModel = CountriesVM(service: service)
        let countriesViewController = ListCountriesVC(countriesVM: viewModel)
        let navigationController = UINavigationController(rootViewController: countriesViewController)
        return navigationController
    }
}

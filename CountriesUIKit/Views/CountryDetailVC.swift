//
//  CountryDetail.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 21/12/2567 BE.
//

import UIKit

class CountryDetailVC: UIViewController {
    
    private let countryVM: CountryVM
    private let countryName :String
    
    init(countryName: String, countryVM: CountryVM) {
        self.countryName = countryName
        self.countryVM = countryVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
//        countryVM.searchCountry(by: countryName) { [weak self] result in
//            switch result {
//            case .success():
//                print(self?.countryVM.country ?? "")
//            case .failure(let error):
//                print(error)
//            }
//        }
    }
    
}

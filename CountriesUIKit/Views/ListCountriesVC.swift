//
//  CountriesListVC.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 20/12/2567 BE.
//

import UIKit

class ListCountriesVC: UIViewController {
    
    private let countriesVM: CountriesVM
    private var countriesTableView: UITableView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(countriesVM: CountriesVM) {
        self.countriesVM = countriesVM
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Countries"
        configureTableView()
        fetchCountries()
    }
    
    private func configureTableView() {
        countriesTableView = UITableView(frame: view.bounds, style: .insetGrouped)
        countriesTableView.register(CountriesCell.self, forCellReuseIdentifier: CountriesCell.useIdentifier)
        countriesTableView.estimatedRowHeight = 74
        countriesTableView.rowHeight = UITableView.automaticDimension
        countriesTableView.separatorStyle = .singleLine
        self.view.backgroundColor = .systemBackground
        view.addSubview(countriesTableView)
        countriesTableView.dataSource = self
        countriesTableView.delegate = self
    }
    
    private func fetchCountries() {
        countriesVM.loadCountries { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.updateData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    private func updateData() {
        countriesTableView.reloadData()
    }
    
}

extension ListCountriesVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countriesVM.regions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let region = countriesVM.regions[section]
        return countriesVM.groupedCountries[region]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countriesVM.regions[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countriesTableView.dequeueReusableCell(withIdentifier: CountriesCell.useIdentifier, for: indexPath) as? CountriesCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        let region = countriesVM.regions[indexPath.section]
        if let country = countriesVM.groupedCountries[region]?[indexPath.row] {
            cell.configure(with: country)
        }
        return cell
    }
}

extension ListCountriesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = countriesVM.regions[indexPath.section]
        if let country = countriesVM.groupedCountries[region]?[indexPath.row] {
            let countryVM = CountryVM(service: Service())
            let countryVC = CountryDetailVC(countryName:country.name.common ?? "" ,countryVM: countryVM)
            navigationController?.pushViewController(countryVC, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let header = view as? UITableViewHeaderFooterView {
            header.textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            header.textLabel?.textColor = .label
            header.textLabel?.textAlignment = .left
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let indexPaths = countriesTableView.indexPathsForVisibleRows else { return }
        let visibleSections = indexPaths.map { $0.section }
        let currentSection = visibleSections.min()
        if let currentSection {
            if scrollView.contentOffset.y <= 0 {
                self.title = "Countries"
            } else {
                self.title = countriesVM.regions[currentSection]
            }
        }
    }
}

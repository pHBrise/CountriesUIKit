//
//  CountriesVC.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 14/12/2567 BE.
//
import UIKit

class CountriesVC : UIViewController {
    enum Section {
        case main
    }
    
    private let viewModel: CountriesVM
    private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section,Country>!
    
    init(viewModel: CountriesVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configuredatasource()
        fetchCountries()
    }
    
    private func fetchCountries() {
        viewModel.loadCountries { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.updateData()
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
    
    private func searchCountries(by name: String) {
        viewModel.searchCountry(by: name) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    print("Countries fetched")
                case .failure(let error):
                    self?.showError(error)
                }
            }
        }
    }
    
    private func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CountryCell.self, forCellWithReuseIdentifier: CountryCell.useIdentifier)
        configureCollectionViewLayout()
    }
    
    private func configureCollectionViewLayout() {
        let width = view.frame.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidth = width - padding * 2 - minimumItemSpacing
        let itemWidth = availableWidth / 2
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth * 0.75)
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.minimumLineSpacing = minimumItemSpacing
        flowLayout.minimumInteritemSpacing = minimumItemSpacing
        collectionView.collectionViewLayout = flowLayout
    }
    
    func configuredatasource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Country>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, country) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CountryCell.useIdentifier, for: indexPath) as! CountryCell
            cell.configure(with: country)
            return cell
        })
    }
    
    func updateData() {
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.countries)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
}

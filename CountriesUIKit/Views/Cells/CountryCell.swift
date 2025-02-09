//
//  CountryCell.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 16/12/2567 BE.
//

import UIKit

class CountryCell: UICollectionViewCell {
    static let useIdentifier = "CountryCell"
    let countryflag = FlagImageView(frame: .zero)
    let countryname = TitleLabel(textAlignment: .center, fontSize: 18)
    let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemPink
        [countryname].forEach { addSubview($0) }
        NSLayoutConstraint.activate([
//            countryflag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
//            countryflag.topAnchor.constraint(equalTo: topAnchor, constant: padding),
//            countryflag.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
//            countryflag.widthAnchor.constraint(equalToConstant: 153),
//            countryflag.heightAnchor.constraint(equalToConstant: 102),
            countryname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            countryname.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            countryname.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            countryname.heightAnchor.constraint(equalToConstant: 24),
//            countryname.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding)
        ])
    }
    
    public func configure(with country: Country) {
        countryname.text = country.name.common
    }
    
}

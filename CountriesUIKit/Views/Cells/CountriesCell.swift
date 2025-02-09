//
//  CountriesCell.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 20/12/2567 BE.
//

import UIKit
import SDWebImage

class CountriesCell: UITableViewCell {
    static let useIdentifier = "CountriesCell"
    let flagImageView = FlagImageView(frame: .zero)
    let nameLabel = TitleLabel(textAlignment: .left, fontSize: 18)
    let populationLabel = BodyLabel(textAlignment: .left, fontSize: 14)
    
    let padding: CGFloat = 12
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        self.accessoryType = .disclosureIndicator
        contentView.addSubview(flagImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(populationLabel)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        populationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            flagImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            flagImageView.widthAnchor.constraint(equalToConstant: 75),
            flagImageView.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            populationLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: padding),
            populationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
    }
    
    func configure(with country: Country) {
        flagImageView.sd_setImage(with: URL(string: country.flags.png))
        nameLabel.text = country.name.common
        populationLabel.text = "Population: \(country.population)"
    }

}

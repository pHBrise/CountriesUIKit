//
//  FlagCell.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 28/12/2567 BE.
//
import UIKit

class FlagCell: UITableViewCell {
    
    static let identifier: String = "FlagCell"
    let flagImageView = FlagImageView(frame: .zero)
    let padding: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        contentView.addSubview(flagImageView)
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            flagImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            flagImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            flagImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            flagImageView.heightAnchor.constraint(equalTo: flagImageView.widthAnchor, multiplier: 0.67)
        ])
    }
    
}

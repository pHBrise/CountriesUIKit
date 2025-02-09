//
//  FlagImageView.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 16/12/2567 BE.
//

import UIKit

class FlagImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        self.clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFit
    }
    
}

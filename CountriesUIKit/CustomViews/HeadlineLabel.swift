//
//  HeadlineLabel.swift
//  CountriesUIKit
//
//  Created by Phanvit Chevamongkolnimit on 21/12/2567 BE.
//
import UIKit

class HeadlineLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment:NSTextAlignment, fontSize:CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        if let fontdescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline).withDesign(.default) {
            self.font = UIFont(descriptor: fontdescriptor, size: fontSize)
        }
        configure()
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

//
//  AHBToggle.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

final class AHBSelectionIndicator: UIView {

    var isSelected: Bool = false {
        didSet {
            backgroundColor = isSelected ? .black : .clear
            layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.lightGray.cgColor
        }
    }

    init(size: CGFloat = 24) {
        super.init(frame: .zero)
        layer.cornerRadius = size / 2
        layer.borderWidth = 2
        layer.borderColor = UIColor.lightGray.cgColor
        backgroundColor = .clear

        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size).isActive = true
        heightAnchor.constraint(equalToConstant: size).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

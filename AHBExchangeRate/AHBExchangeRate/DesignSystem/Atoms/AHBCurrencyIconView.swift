//
//  AHBIcon.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

final class CurrencyIconView: UIView {

    private let iconLabel: UILabel = {
        let label = UILabel()
        label.text = "$"
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    init(size: CGFloat = 36, backgroundColor: UIColor = UIColor.blue) {
        super.init(frame: .zero)
        setupView(size: size, backgroundColor: backgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(size: CGFloat, backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = size / 2
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: size).isActive = true
        self.heightAnchor.constraint(equalToConstant: size).isActive = true

        addSubview(iconLabel)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func setCurrencySymbol(_ symbol: String) {
        iconLabel.text = symbol
    }
}


//
//  ExchangeRateRow.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

class ExchangeRateCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var currencyCodeLabel: AHBLabel!            // e.g. BTC
    @IBOutlet private weak var currencyFullNameLabel: AHBLabel! {
        didSet {
            currencyFullNameLabel.style = .subtitle
        }
    }       // e.g. Bitcoin
    @IBOutlet private weak var exchangeRateLabel: AHBLabel!            // e.g. $93412.00
    @IBOutlet private weak var percentageChangeLabel: AHBLabel!        // e.g. +0.02%
    @IBOutlet private weak var currencyIconContainer: UIView!          // Container for CurrencyIconView

    // MARK: - Properties
    private var iconView: CurrencyIconView?

    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconView?.removeFromSuperview()
        iconView = nil
    }

    // MARK: - Configuration
    func configure(with model: ExchangeRateUIModel) {
        currencyCodeLabel.text = model.currencyCode
        currencyFullNameLabel.text = model.currencyName
        exchangeRateLabel.text = "\(model.symbol) \(model.rate ?? "")"
        percentageChangeLabel.text = model.change
        percentageChangeLabel.style = (model.change ?? "").contains("-") ? .negativeChange : .positiveChange

        // Add Currency Icon
        let icon = CurrencyIconView()
        icon.setCurrencySymbol(model.symbol)
        currencyIconContainer.addSubview(icon)

        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: currencyIconContainer.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: currencyIconContainer.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 36),
            icon.heightAnchor.constraint(equalToConstant: 36)
        ])

        iconView = icon
    }
}



//
//  AddAssetRow.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

class AddAssetCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet private weak var currencyCodeLabel: AHBLabel!            // e.g. BTC
    @IBOutlet private weak var currencyFullNameLabel: AHBLabel! {      // e.g. Bitcoin
        didSet {
            currencyFullNameLabel.style = .subtitle
        }
    }
    @IBOutlet private weak var currencyIconContainer: UIView!          // For currency symbol icon
    @IBOutlet private weak var selectionIndicatorContainer: UIView!    // For the AHBSelectionIndicator

    // MARK: - Views
    private var iconView: CurrencyIconView?
    private var selectionIndicator: AHBSelectionIndicator?

    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconView?.removeFromSuperview()
        selectionIndicator?.removeFromSuperview()
        iconView = nil
        selectionIndicator = nil
    }

    // MARK: - Configuration
    func configure(with model: ExchangeRateUIModel) {
        currencyCodeLabel.text = model.currencyCode
        currencyFullNameLabel.text = model.currencyName

        // MARK: Add Currency Icon
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

        // MARK: Add Selection Indicator
        let indicator = AHBSelectionIndicator()
        indicator.isSelected = model.isSelected
        selectionIndicatorContainer.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: selectionIndicatorContainer.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: selectionIndicatorContainer.centerYAnchor),
            indicator.widthAnchor.constraint(equalToConstant: 24),
            indicator.heightAnchor.constraint(equalToConstant: 24)
        ])
        selectionIndicator = indicator
    }
}

//
//  AddAssetPresenter.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

protocol AddAssetPresentationLogic {
    func presentAssets(_ popular: [ExchangeRateUIModel], _ crypto: [ExchangeRateUIModel], selected: Set<String>)
    func updateSelection(code: String, selected: Bool)
}

final class AddAssetPresenter: AddAssetPresentationLogic {

    weak var viewController: AddAssetDisplayLogic?

    func presentAssets(_ popular: [ExchangeRateUIModel], _ crypto: [ExchangeRateUIModel], selected: Set<String>) {
        let popularSection = AddAssetSectionViewModel(
            title: "Popular Assets",
            assets: popular.map {
                AddAssetItemViewModel(code: $0.currencyCode, name: $0.currencyName, isSelected: selected.contains($0.currencyCode))
            })

        let cryptoSection = AddAssetSectionViewModel(
            title: "Cryptocurrencies",
            assets: crypto.map {
                AddAssetItemViewModel(code: $0.currencyCode, name: $0.currencyName, isSelected: selected.contains($0.currencyCode))
            })

        viewController?.displayAssets([popularSection, cryptoSection])
    }

    func updateSelection(code: String, selected: Bool) {
        viewController?.updateAssetSelection(code: code, isSelected: selected)
    }
}


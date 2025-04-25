//
//  ExchangeRatesRouter.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

protocol ExchangeRatesRoutingLogic {
    func routeToAddAsset(allCurrencies: [ExchangeRateUIModel])}

final class ExchangeRatesRouter: ExchangeRatesRoutingLogic {

    weak var viewController: UIViewController?

    func routeToAddAsset(allCurrencies: [ExchangeRateUIModel]) {

        let input = AddAssetInput(availableCurrencies: allCurrencies)
        let addAssetVC = AddAssetConfigurator.configure(input: input)

        viewController?.navigationController?.pushViewController(addAssetVC, animated: true)
    }
}


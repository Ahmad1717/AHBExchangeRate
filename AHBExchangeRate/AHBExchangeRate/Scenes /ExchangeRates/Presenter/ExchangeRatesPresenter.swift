//
//  ExchangeRatesPresenter.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

protocol ExchangeRatesPresentationLogic {
    func presentFetchedRates(liveModel: ExchangeRateAPIModel, changeModel: ChangeAPIModel?, selectedSymbols: [String])
    func presentError(_ error: Error)
    func showLoading()
    func hideLoading()
}

final class ExchangeRatesPresenter: ExchangeRatesPresentationLogic {

    weak var viewController: ExchangeRatesDisplayLogic?

    func presentFetchedRates(liveModel: ExchangeRateAPIModel, changeModel: ChangeAPIModel?, selectedSymbols: [String]) {

        // Generate all UI models (unfiltered)
        let allUIModels: [ExchangeRateUIModel] = liveModel.quotes.compactMap { (key, value) in
            let currencyCode = key.replacingOccurrences(of: liveModel.source, with: "")
            let invertedValue = value == 0 ? 0 : (1.0 / value)
            let isCrypto = cryptoCodes.contains(currencyCode.uppercased())
            let decimals = isCrypto ? 2 : 4
            let formattedRate = String(format: "%.\(decimals)f", invertedValue)
            let changePct = changeModel?.quotes[key]?.change_pct ?? 0
            let changeString = String(format: "%+.2f%%", changePct)
            let name = CurrencyMetadata.namesAndSymbols[currencyCode]?.name ?? currencyCode
            let symbol = CurrencyMetadata.namesAndSymbols[currencyCode]?.symbol ?? ""

            return ExchangeRateUIModel(
                currencyCode: currencyCode,
                currencyName: name,
                symbol: symbol,
                rate: formattedRate,
                isCrypto: isCrypto,
                change: changeString
            )
        }.sorted { $0.currencyCode < $1.currencyCode }

        // Filtered for display based on user settings
        let filteredUIModels = allUIModels.filter { selectedSymbols.contains($0.currencyCode) }
        let availableCurrencies = allUIModels.map {
            var asset = $0
            asset.isCrypto = cryptoCodes.contains(asset.currencyCode.uppercased())
            return asset
        }
        let viewModel = ExchangeRatesViewModel(displayedRates: filteredUIModels)
        viewController?.displayFetchedRates(viewModel, allCurrencies: availableCurrencies)
    }


    func presentError(_ error: Error) {
        viewController?.displayError("Something went wrong: \(error.localizedDescription)")
    }
    
    func showLoading() {
        viewController?.showLoading()
    }
    
    func hideLoading() {
        viewController?.hideLoading()
    }
    
}


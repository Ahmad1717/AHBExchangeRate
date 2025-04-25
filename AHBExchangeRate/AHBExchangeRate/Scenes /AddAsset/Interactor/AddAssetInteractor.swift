//
//  AddAssetInteractor.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

protocol AddAssetBusinessLogic {
    func fetchAssets()
    func toggleAssetSelection(code: String)
    func saveSelectedAssets()
}

final class AddAssetInteractor: AddAssetBusinessLogic {

    var presenter: AddAssetPresentationLogic?
    var worker: AddAssetWorkerProtocol = AddAssetWorker()

    var availableCurrencies: [ExchangeRateUIModel] = []

    // Track current selection in memory
    private lazy var selectedCodes: Set<String> = Set(worker.getSelectedSymbols())

    func fetchAssets() {
        let filtered = availableCurrencies.filter {
            CurrencyMetadata.namesAndSymbols[$0.currencyCode] != nil
        }

        let popularAssets = filtered.filter { !cryptoCodes.contains($0.currencyCode.uppercased()) }
        let cryptoAssets = filtered.filter { cryptoCodes.contains($0.currencyCode.uppercased()) }

        presenter?.presentAssets(popularAssets, cryptoAssets, selected: selectedCodes)
    }

    func toggleAssetSelection(code: String) {
        if selectedCodes.contains(code) {
            selectedCodes.remove(code)
        } else {
            selectedCodes.insert(code)
        }

        fetchAssets() // update UI only
    }

    func saveSelectedAssets() {
        worker.saveSelectedSymbols(Array(selectedCodes))
    }
}



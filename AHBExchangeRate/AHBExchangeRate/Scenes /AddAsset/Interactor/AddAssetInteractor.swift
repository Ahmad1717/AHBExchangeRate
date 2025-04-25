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
    func updateSearch(query: String)
    func saveSelectedAssets()
}

final class AddAssetInteractor: AddAssetBusinessLogic {

    var presenter: AddAssetPresentationLogic?
    var worker: AddAssetWorkerProtocol = AddAssetWorker()

    var availableCurrencies: [ExchangeRateUIModel] = []
    private var selectedCodes: Set<String> = []
    private var currentSearchQuery: String = ""

    func fetchAssets() {
        selectedCodes = Set(worker.getSelectedSymbols())
        updateSearch(query: "")
    }

    func updateSearch(query: String) {
        currentSearchQuery = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()

        let filtered = availableCurrencies.filter {
            CurrencyMetadata.namesAndSymbols[$0.currencyCode] != nil
        }

        let filteredByQuery = currentSearchQuery.isEmpty ? filtered : filtered.filter {
            $0.currencyCode.lowercased().contains(currentSearchQuery) ||
            $0.currencyName.lowercased().contains(currentSearchQuery)
        }

        let popularAssets = filteredByQuery.filter { !cryptoCodes.contains($0.currencyCode.uppercased()) }
        let cryptoAssets = filteredByQuery.filter { cryptoCodes.contains($0.currencyCode.uppercased()) }

        presenter?.presentAssets(popularAssets, cryptoAssets, selected: selectedCodes)
    }

    func toggleAssetSelection(code: String) {
        if selectedCodes.contains(code) {
            selectedCodes.remove(code)
        } else {
            selectedCodes.insert(code)
        }
        presenter?.updateSelection(code: code, selected: selectedCodes.contains(code))
    }

    func saveSelectedAssets() {
        worker.saveSelectedSymbols(Array(selectedCodes))
    }
}

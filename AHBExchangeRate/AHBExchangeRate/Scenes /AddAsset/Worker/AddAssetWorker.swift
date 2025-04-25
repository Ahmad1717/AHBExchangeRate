//
//  AddAssetWorker.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

final class AddAssetWorker: AddAssetWorkerProtocol {
    
    func getSelectedSymbols() -> [String] {
        UserDefaultsManager.shared.ensureDefaultCurrencies()
    }
    
    func saveSelectedSymbols(_ symbols: [String]) {
        UserDefaultsManager.shared.selectedCurrencyCodes = symbols.sorted()
    }
    
}

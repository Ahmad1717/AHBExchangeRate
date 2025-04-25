//
//  ExchangeRatesWorker.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

final class ExchangeRatesWorker: ExchangeRatesWorkerProtocol {
    
    func fetchRatesAndChanges(
        base: String,
        symbols: [String],
        completion: @escaping (Result<(ExchangeRateAPIModel, ChangeAPIModel?), Error>) -> Void
    ) {
        let exchangeService = ExchangeServiceModule.live(base: base, symbols: symbols)
        
        ServiceManager.shared.request(exchangeService) { (result: Result<ExchangeRateAPIModel, Error>) in
            switch result {
            case .success(let liveModel):
                let changeService = ExchangeServiceModule.change(base: base, symbols: symbols)
                
                ServiceManager.shared.request(changeService) { (changeResult: Result<ChangeAPIModel, Error>) in
                    switch changeResult {
                    case .success(let changeModel):
                        completion(.success((liveModel, changeModel)))
                    case .failure:
                        completion(.success((liveModel, nil))) // fallback if change fails
                    }
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getSelectedSymbols() -> [String] {
        UserDefaultsManager.shared.ensureDefaultCurrencies()
    }
    
    func saveSelectedSymbols(_ symbols: [String]) {
        UserDefaultsManager.shared.selectedCurrencyCodes = symbols.sorted()
    }
    
    func deleteSymbol(_ symbol: String) {
        var current = Set(UserDefaultsManager.shared.selectedCurrencyCodes)
        current.remove(symbol)
        UserDefaultsManager.shared.selectedCurrencyCodes = Array(current).sorted()
    }
}



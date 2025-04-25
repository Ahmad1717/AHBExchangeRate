//
//  ExchangeRatesWorkerProtocol.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

protocol ExchangeRatesWorkerProtocol {
    func fetchRatesAndChanges(
        base: String,
        symbols: [String],
        completion: @escaping (Result<(ExchangeRateAPIModel, ChangeAPIModel?), Error>) -> Void
    )
    
    func getSelectedSymbols() -> [String]
    func saveSelectedSymbols(_ symbols: [String])
    func deleteSymbol(_ symbol: String)
}

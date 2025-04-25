//
//  ExchangeRateUIModel.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

struct ExchangeRateUIModel {
    let currencyCode: String
    let currencyName: String
    let symbol: String
    let rate: String?
    var isCrypto: Bool
    let change: String?
    var isSelected = false
}

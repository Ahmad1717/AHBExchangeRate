//
//  ExchangeRateAPIModel.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

struct ExchangeRateAPIModel: Codable {
    let success: Bool
    let source: String
    let quotes: [String: Double]
}

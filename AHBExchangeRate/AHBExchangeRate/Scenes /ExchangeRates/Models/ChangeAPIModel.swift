//
//  ChangeAPIModel.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

struct ChangeAPIModel: Codable {
    let success: Bool
    let quotes: [String: CurrencyChange]
}

struct CurrencyChange: Codable {
    let start_rate: Double
    let end_rate: Double
    let change: Double
    let change_pct: Double
}

//
//  CurrencyMetadata.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import Foundation

struct CurrencyMetadata {
    static let namesAndSymbols: [String: (name: String, symbol: String)] = [
        // Fiat currencies
        "USD": ("United States Dollar", "$"),
        "EUR": ("Euro", "€"),
        "GBP": ("British Pound Sterling", "£"),
        "JPY": ("Japanese Yen", "¥"),
        "AUD": ("Australian Dollar", "A$"),
        "CAD": ("Canadian Dollar", "C$"),
        "CHF": ("Swiss Franc", "CHF"),
        "INR": ("Indian Rupee", "₹"),
        "CNY": ("Chinese Yuan", "¥"),
        "ZAR": ("South African Rand", "R"),

        // Cryptocurrencies
        "BTC": ("Bitcoin", "₿"),
        "ETH": ("Ethereum", "Ξ"),
        "XRP": ("Ripple", "XRP"),
        "USDT": ("Tether", "₮"),
        "BNB": ("Binance Coin", "BNB"),
        "ADA": ("Cardano", "ADA"),
        "DOGE": ("Dogecoin", "Ð"),
        "SOL": ("Solana", "SOL"),
        "DOT": ("Polkadot", "DOT"),
        "AVAX": ("Avalanche", "AVAX")
    ]
}


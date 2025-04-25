//
//  Environment.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

enum Environment {

    static let exchangeRateApiKey = getString(for: .exchangeRateApiKey)

    static func value(for key: Key) throws -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as? String else {
            throw Error.missingKey
        }
        return value.replacingOccurrences(of: "\\", with: "")
    }

    private static func getString(for key: Key) -> String {
        return (try? value(for: key)) ?? ""
    }

    private static func getURL(for key: Key) -> URL {
        return URL(string: getString(for: key)) ?? URL(fileURLWithPath: "")
    }
}

extension Environment {
    enum Key: String {
        case exchangeRateApiKey = "EXCHANGE_RATE_API_KEY"
    }

    enum Error: Swift.Error {
        case missingKey
    }
}


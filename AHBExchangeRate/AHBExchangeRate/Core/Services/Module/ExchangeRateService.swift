//
//  ExchangeRateService.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation
import Alamofire

enum ExchangeServiceModule: ServiceModule {
    case live(base: String, symbols: [String])
    case change(base: String, symbols: [String])

    var baseURL: URL {
        return URL(string: "https://api.exchangerate.host")!
    }

    var path: String {
        switch self {
        case .live:
            return "live"
        case .change:
            return "change"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var headers: [String: String]? {
        return Headers.defaultHeaders()
    }

    var parameters: [String: Any]? {
        switch self {
        case let .live(base, symbols):
            return buildParams(base: base, symbols: symbols, key: "symbols")
        case let .change(base, symbols):
            return buildParams(base: base, symbols: symbols, key: "currencies")
        }
    }

    var body: Data? {
        return nil
    }

    private func buildParams(base: String, symbols: [String], key: String) -> [String: Any] {
        var params: [String: Any] = [
            "base": base,
            key: symbols.joined(separator: ",")
        ]
        if !Environment.exchangeRateApiKey.isEmpty {
            params["access_key"] = Environment.exchangeRateApiKey
        }
        return params
    }
}



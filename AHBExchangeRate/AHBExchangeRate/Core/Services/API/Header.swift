//
//  Header.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

struct Headers {
    static func defaultHeaders(authRequired: Bool = false) -> [String: String] {
        let headers: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        return headers
    }
}

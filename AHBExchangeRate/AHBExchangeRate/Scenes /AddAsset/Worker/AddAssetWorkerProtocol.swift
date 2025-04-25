//
//  AddAssetWorkerProtocol.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

protocol AddAssetWorkerProtocol {
    
    func getSelectedSymbols() -> [String]
    func saveSelectedSymbols(_ symbols: [String])
}

//
//  UserDefaultsManager.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

public final class UserDefaultsManager {

    // MARK: - Singleton
    public static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    private init() {}

    // MARK: - Selected Currencies (Public Interface)

    public var selectedCurrencyCodes: [String] {
        get {
            defaults.stringArray(forKey: Key.selectedCurrencies.rawValue) ?? []
        }
        set {
            let unique = Array(Set(newValue)).sorted()
            defaults.set(unique, forKey: Key.selectedCurrencies.rawValue)
        }
    }

    public func clearSelectedCurrencies() {
        defaults.removeObject(forKey: Key.selectedCurrencies.rawValue)
    }

    // MARK: - Generic Helpers (Scalable)

    public func getString(for key: Key) -> String? {
        return defaults.string(forKey: key.rawValue)
    }

    public func setString(_ value: String, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }

    public func getBool(for key: Key) -> Bool {
        return defaults.bool(forKey: key.rawValue)
    }

    public func setBool(_ value: Bool, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }

    public func removeValue(for key: Key) {
        defaults.removeObject(forKey: key.rawValue)
    }

    public func resetAll() {
        Key.allCases.forEach { removeValue(for: $0) }
    }
}

// MARK: - Keys Enum
public extension UserDefaultsManager {
    enum Key: String, CaseIterable {
        case selectedCurrencies
        // Add future keys here
    }
}

extension UserDefaultsManager {
    public func ensureDefaultCurrencies() -> [String] {
        if selectedCurrencyCodes.isEmpty {
            let defaultSymbols = ["USD", "EUR", "BTC"]
            selectedCurrencyCodes = defaultSymbols
        }
        return selectedCurrencyCodes
    }
}


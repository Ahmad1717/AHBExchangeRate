//
//  AFDataResponse+Extesnsions.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Alamofire
import Foundation

extension AFDataResponse {
    func debugPrint<T: Decodable>(as type: T.Type) {
        print("📡 [REQUEST]")
        print("URL: \(self.request?.url?.absoluteString ?? "nil")")
        print("Headers: \(self.request?.allHTTPHeaderFields ?? [:])")
        print("Method: \(self.request?.httpMethod ?? "nil")")
        
        if let body = self.request?.httpBody,
           let json = try? JSONSerialization.jsonObject(with: body, options: .mutableContainers) {
            print("Body:", json)
        }

        print("\n📥 [RESPONSE]")
        print("Status Code: \(self.response?.statusCode ?? -1)")
        
        if let data = self.data {
            if let body = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print("Body:", body)
            } else {
                print("Raw:", String(data: data, encoding: .utf8) ?? "Invalid UTF-8")
            }
        } else {
            print("No response data")
        }

        print("\n📊 [RESULT]")
        switch self.result {
        case .success(let decoded):
            print("✅ Success: \(decoded)")
        case .failure(let error):
            print("❌ Failure: \(error.localizedDescription)")
        }
        print("–––––––––––––––––––––––––––––––––––")
    }
}


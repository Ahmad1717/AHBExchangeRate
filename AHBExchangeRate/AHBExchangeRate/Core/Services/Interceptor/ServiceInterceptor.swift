//
//  ServiceInterceptor.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation
import Alamofire

final class ServiceInterceptor {
    static let shared = ServiceInterceptor()

    private init() {}

    func intercept<T: Decodable>(
        response: AFDataResponse<T>,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        switch response.result {
        case .success(let value): completion(.success(value))
        case .failure(let error): completion(.failure(error))
        }
    }

    func clearApisCaches() {
        URLCache.shared.removeAllCachedResponses()
    }
}

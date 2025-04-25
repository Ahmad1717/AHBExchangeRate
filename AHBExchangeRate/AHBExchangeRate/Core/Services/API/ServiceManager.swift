//
//  ServiceManager.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation
import Alamofire

final class ServiceManager {
    static let shared = ServiceManager()
    private init() {}
    
    private lazy var manager: Alamofire.Session = {
        let configuration = URLSessionConfiguration.default
        let redirectHandler = CustomRedirectHandler() // ← use your handler
        return Session(configuration: configuration, redirectHandler: redirectHandler)
    }()
    
    func request<T: Decodable>(_ module: ServiceModule, completion: @escaping (Result<T, Error>) -> Void) {
        let url = module.baseURL.appendingPathComponent(module.path)
        let encoding: ParameterEncoding = module.method == .get ? URLEncoding.default : JSONEncoding.default
        
        manager.request(
            url,
            method: module.method,
            parameters: module.parameters,
            encoding: encoding,
            headers: HTTPHeaders(module.headers ?? [:])
        )
        .validate()
        .responseDecodable(of: T.self) { response in
            response.debugPrint(as: T.self)
            completion(response.result.mapError { $0 as Error })
        }
    }
}

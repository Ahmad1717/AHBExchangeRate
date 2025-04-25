//
//  CustomRedirectHandler.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Alamofire
import Foundation

final class CustomRedirectHandler: RedirectHandler {
    func task(
        _ task: URLSessionTask,
        willBeRedirectedTo request: URLRequest,
        for response: HTTPURLResponse,
        completion: @escaping (URLRequest?) -> Void
    ) {
        if response.statusCode == 303 {
            completion(nil) // Cancel redirect
        } else {
            completion(request) // Follow other redirects normally
        }
    }
}

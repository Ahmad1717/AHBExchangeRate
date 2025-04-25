//
//  ExchangeRatesConfigurator.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

final class ExchangeRatesConfigurator {
    static func viewController() -> UIViewController {
        let viewController = ExchangeRatesViewController()
        let interactor = ExchangeRatesInteractor()
        let presenter = ExchangeRatesPresenter()
        let router = ExchangeRatesRouter()

        viewController.interactor = interactor
        viewController.router = router

        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}

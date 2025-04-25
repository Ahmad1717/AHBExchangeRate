//
//  AddAssetConfigurator.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

struct AddAssetInput {
    let availableCurrencies: [ExchangeRateUIModel]
}

final class AddAssetConfigurator {
    static func configure(input: AddAssetInput) -> UIViewController {
        let viewController = AddAssetViewController()
        let interactor = AddAssetInteractor()
        let presenter = AddAssetPresenter()
        let router = AddAssetRouter()

        viewController.interactor = interactor
        viewController.router = router

        interactor.presenter = presenter
        interactor.availableCurrencies = input.availableCurrencies
        
        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}

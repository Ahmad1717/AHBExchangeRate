//
//  AddAssetRouter.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

protocol AddAssetRoutingLogic {
    func dismiss()
}

final class AddAssetRouter: AddAssetRoutingLogic {
    weak var viewController: UIViewController?

    func dismiss() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

//
//  AddAssetViewController.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

protocol AddAssetDisplayLogic: AnyObject {
    func displayAssets(_ sections: [AddAssetSectionViewModel])
}

final class AddAssetViewController: BaseTableViewController {

    var interactor: AddAssetBusinessLogic?
    var router: AddAssetRoutingLogic?

    var sectionViewModels: [AddAssetSectionViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AddAssetCell.self)

        interactor?.fetchAssets()
    }

    override func setupNavigationBar() {
        super.setupNavigationBar()
        title = "Add Asset"
        let addButton = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(doneTapped)
        )
        navigationItem.rightBarButtonItem = addButton
    }

    @objc private func doneTapped() {
        interactor?.saveSelectedAssets()
        router?.dismiss()
    }
}

// MARK: - Display Logic
extension AddAssetViewController: AddAssetDisplayLogic {
    func displayAssets(_ sections: [AddAssetSectionViewModel]) {
        sectionViewModels = sections
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

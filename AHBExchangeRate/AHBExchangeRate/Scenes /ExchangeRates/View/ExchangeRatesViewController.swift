//
//  ExchangeRatesViewController.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

// MARK: - Protocol from Presenter
protocol ExchangeRatesDisplayLogic: AnyObject {
    func displayFetchedRates(_ viewModel: ExchangeRatesViewModel, allCurrencies: [ExchangeRateUIModel])
    func displayError(_ message: String)
    func showLoading()
    func hideLoading()
}

final class ExchangeRatesViewController: BaseTableViewController {
    
    var interactor: ExchangeRatesBusinessLogic?
    var router: ExchangeRatesRoutingLogic?
    
    var displayedRates: [ExchangeRateUIModel] = []
    private var allCurrencies: [ExchangeRateUIModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExchangeRateCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.fetchRates()
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        let addButton = UIBarButtonItem(
            title: "Add Currency",
            style: .plain,
            target: self,
            action: #selector(didTapAddCurrency)
        )
        navigationItem.rightBarButtonItem = addButton
        title = "Exchange Rates"
    }
    
    @objc private func didTapAddCurrency() {
        router?.routeToAddAsset(allCurrencies: allCurrencies)
    }
}

private extension ExchangeRatesViewController {
    
}

// MARK: - Display Logic
extension ExchangeRatesViewController: ExchangeRatesDisplayLogic {
    func displayFetchedRates(_ viewModel: ExchangeRatesViewModel, allCurrencies: [ExchangeRateUIModel]) {
        displayedRates = viewModel.displayedRates
        self.allCurrencies = allCurrencies
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

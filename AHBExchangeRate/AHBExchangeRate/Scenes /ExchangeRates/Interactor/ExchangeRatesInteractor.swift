//
//  ExchangeRatesInteractor.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

protocol ExchangeRatesBusinessLogic {
    func fetchRates()
    func stopAutoRefresh()
    func deleteCurrency(code: String)
}

final class ExchangeRatesInteractor: ExchangeRatesBusinessLogic {

    // MARK: - Properties
    var presenter: ExchangeRatesPresentationLogic?
    var worker: ExchangeRatesWorkerProtocol = ExchangeRatesWorker()

    private var baseCurrency: String = "USD"

//    private var refreshTimer: Timer?
//    private var isLoadingRates = false

    // MARK: - Business Logic

    func fetchRates() {
//        guard !isLoadingRates else { return }
//        isLoadingRates = true

        let symbols = worker.getSelectedSymbols()

        presenter?.showLoading()
        worker.fetchRatesAndChanges(base: baseCurrency, symbols: symbols) { [weak self] result in
            guard let self = self else { return }
            self.presenter?.hideLoading()
//            self.isLoadingRates = false

            switch result {
            case .success(let (liveModel, changeModel)):
                self.presenter?.presentFetchedRates(liveModel: liveModel, changeModel: changeModel, selectedSymbols: worker.getSelectedSymbols())
//                self.startAutoRefresh()

            case .failure(let error):
                self.presenter?.presentError(error)
            }
        }
    }

    // MARK: - Auto Refresh Logic

    private func startAutoRefresh() {
//        refreshTimer?.invalidate()
//        refreshTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
//            self?.fetchRates()
//        }
    }

    func stopAutoRefresh() {
//        refreshTimer?.invalidate()
//        refreshTimer = nil
    }
    
    func deleteCurrency(code: String) {
        worker.deleteSymbol(code)
        fetchRates()
    }
}



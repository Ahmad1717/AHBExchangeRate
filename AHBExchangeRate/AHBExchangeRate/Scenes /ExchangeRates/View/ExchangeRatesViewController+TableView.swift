//
//  ExchangeRatesViewController+TableView.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

extension ExchangeRatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedRates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = displayedRates[indexPath.row]
        let cell = ExchangeRateCell.dequeueReusableCell(in: tableView, indexPath: indexPath)
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

extension ExchangeRatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completion in
            guard let self = self else { return }
            
            let model = self.displayedRates[indexPath.row]
            self.interactor?.deleteCurrency(code: model.currencyCode)
            
            completion(true)
        }

        deleteAction.backgroundColor = .blue

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

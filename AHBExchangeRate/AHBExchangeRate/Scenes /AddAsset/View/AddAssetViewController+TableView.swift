//
//  AddAssetViewController+TableView.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

extension AddAssetViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int { sectionViewModels.count }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModels[section].assets.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionViewModels[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sectionViewModels[indexPath.section].assets[indexPath.row]
        let cell = AddAssetCell.dequeueReusableCell(in: tableView, indexPath: indexPath)

        let symbol = CurrencyMetadata.namesAndSymbols[item.code]?.symbol ?? "$"
        let model = ExchangeRateUIModel(
            currencyCode: item.code,
            currencyName: item.name,
            symbol: symbol,
            rate: nil,
            isCrypto: cryptoCodes.contains(item.code),
            change: nil,
            isSelected: item.isSelected
        )

        cell.configure(with: model)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let asset = sectionViewModels[indexPath.section].assets[indexPath.row]
        interactor?.toggleAssetSelection(code: asset.code)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

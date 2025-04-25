//
//  AddAssetViewController.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

protocol AddAssetDisplayLogic: AnyObject {
    func displayAssets(_ sections: [AddAssetSectionViewModel])
    func updateAssetSelection(code: String, isSelected: Bool)
}

final class AddAssetViewController: BaseTableViewController {
    
    var interactor: AddAssetBusinessLogic?
    var router: AddAssetRoutingLogic?
    
    var sectionViewModels: [AddAssetSectionViewModel] = []
    private let searchController = UISearchController(searchResultsController: nil)
    
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
        
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search currencies"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Done", style: .done,
            target: self,
            action: #selector(doneTapped)
        )
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
    
    func updateAssetSelection(code: String, isSelected: Bool) {
        for sectionIndex in sectionViewModels.indices {
            if let rowIndex = sectionViewModels[sectionIndex].assets.firstIndex(where: { $0.code == code }) {
                sectionViewModels[sectionIndex].assets[rowIndex].isSelected = isSelected
                DispatchQueue.main.async {
                    let indexPath = IndexPath(row: rowIndex, section: sectionIndex)
                    self.tableView.reloadRows(at: [indexPath], with: .automatic)
                }
                break
            }
        }
    }
}

// MARK: - Search Handling
extension AddAssetViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        interactor?.updateSearch(query: searchController.searchBar.text ?? "")
    }
}

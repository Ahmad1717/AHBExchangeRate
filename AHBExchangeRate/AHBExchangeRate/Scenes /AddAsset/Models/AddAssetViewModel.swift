//
//  AddAssetViewModel.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import Foundation

struct AddAssetSectionViewModel {
    let title: String
    let assets: [AddAssetItemViewModel]
}

struct AddAssetItemViewModel {
    let code: String
    let name: String
    let isSelected: Bool
}

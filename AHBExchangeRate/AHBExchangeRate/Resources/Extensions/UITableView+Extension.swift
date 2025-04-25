//
//  UITableView+Extension.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }
    
    func registerClass<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func endRefreshing() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl?.endRefreshing()
            self?.setContentOffset(.zero, animated: true)
        }
    }

    func beginRefreshing() {
        DispatchQueue.main.async { [weak self] in
            self?.refreshControl?.beginRefreshing()
            self?.setContentOffset(CGPoint(x: 0, y: -60), animated: true)
        }
    }

    func setRefreshControl(color: UIColor = .gray, target: Any, action: Selector?) {
        let refresh = UIRefreshControl()
        refresh.tintColor = color
        if let action = action {
            refresh.addTarget(target, action: action, for: .valueChanged)
        }
        self.refreshControl = refresh
    }

    func updateTableView() {
        CATransaction.begin()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.beginUpdates()
            CATransaction.setCompletionBlock {
                self.reloadData()
            }
            self.endUpdates()
        }
        CATransaction.commit()
    }

    func getCellWithIdentifier(identifier: String) -> UITableViewCell? {
        return visibleCells.first { $0.reuseIdentifier == identifier }
    }
}

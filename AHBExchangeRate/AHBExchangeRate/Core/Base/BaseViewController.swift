//
//  BaseViewController.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

class BaseTableViewController: UIViewController {

    // MARK: - UI
    let tableView: UITableView
    
    private var loadingIndicatorTag: Int { return 99999 }
    

    // MARK: - Init
    init(style: UITableView.Style = .plain) {
        self.tableView = UITableView(frame: .zero, style: style)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.tableView = UITableView(frame: .zero, style: .plain)
        super.init(coder: coder)
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }

    // MARK: - Navigation Bar Setup (Override in subclasses)
    func setupNavigationBar() {
        // Subclasses override to set nav bar items
    }

    // MARK: - Error Handling
    func displayError(_ message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Error",
                message: message,
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showLoading() {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = view.center
        spinner.startAnimating()
        spinner.tag = loadingIndicatorTag
        view.addSubview(spinner)
    }

    func hideLoading() {
        if let spinner = view.viewWithTag(loadingIndicatorTag) as? UIActivityIndicatorView {
            spinner.stopAnimating()
            spinner.removeFromSuperview()
        }
    }

    // MARK: - Table View Setup
    private func setupTableView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

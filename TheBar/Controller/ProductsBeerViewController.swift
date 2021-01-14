//
//  ProductsBeerViewController.swift
//  TheBar
//
//  Created by Bruno Meneghin on 14/01/21.
//

import Foundation
import UIKit

private let cellIReusableIdentifier: String = "CellID"

class ProductsBeerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Instances & Properties
    
    fileprivate var customNavBarScrollEdgeAppearence = UINavigationBarAppearance()
    
    private lazy var tableView = CustomTableView(frame: CGRect.zero,
                                                 style: .grouped)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductsBeerTableViewCell.self, forCellReuseIdentifier: cellIReusableIdentifier)
        
        setupUI()
    }
    
    // MARK: Functions
    
    private func setupUI() {
        navigationController?.navigationBar.topItem?.title = "Beers"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = customNavBarScrollEdgeAppearence
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    // MARK: - TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        25
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIReusableIdentifier, for: indexPath) as? ProductsBeerTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = "Products Test"
        
        return cell
    }
}

//
//  ProductListViewController.swift
//  producthuntclient
//
//  Created by Alex Korzh on 2/2/19.
//  Copyright © 2019 Alex Korzh. All rights reserved.
//

import Foundation
import UIKit

class ProductListViewController: UITableViewController {
    
    fileprivate lazy var viewModel: ProductListViewModel = {
        return ProductListViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Product Hunt"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        initializeViewModel()
    }
    
    fileprivate func initializeViewModel() {
        let loadDataErrorAlert = UIAlertController(title: "Whoops!", message: "Something went wrong!", preferredStyle: .alert)
        loadDataErrorAlert.addAction( UIAlertAction(title: "Retry", style: .default, handler: { [weak self] action in self?.viewModel.loadData() }))
        loadDataErrorAlert.addAction( UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        viewModel.onErrorOccured = { [weak self] in
            self?.present(loadDataErrorAlert, animated: true, completion: nil)
        }
        
        viewModel.loadData()
    }
    
    func pushViewController(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier: "productItemCell", for: indexPath)
            as? ProductItemCellViewController else { fatalError("Cell not exists in storyboard") }
        
        let cellViewModel = viewModel.getCellViewModel( at: indexPath )
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onItemSelected(at: indexPath)
    }
}

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
    
    fileprivate var viewModel: ProductListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "photoCellIdentifier", for: indexPath)
            as? ProductItemCellViewController else { fatalError("Cell not exists in storyboard") }
        
        let cellViewModel = viewModel.getCellViewModel( at: indexPath )
        cell.viewModel = cellViewModel
        
        return cell
    }
}

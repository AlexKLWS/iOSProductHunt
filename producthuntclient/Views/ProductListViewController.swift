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
    
    fileprivate var screenOverlay: UIView?
    
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
        
        viewModel.pushDetailController = { [weak self] controller in
            self?.pushViewController(controller: controller)
        }
        
        viewModel.onLoadingStateChange = { [weak self] isLoading in
            if (isLoading) {
                self?.showIndicator()
            } else {
                self?.hideIndicator()
            }
        }
        
        viewModel.loadData()
    }
    
    // MARK: - UINavigationController
    
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
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedItemIndex = indexPath
    }
    
    // MARK: - ActivityIndicator
    
    fileprivate func showIndicator() {
        hideIndicator()
        
        let overlay = setupOverlay()
        
        let indicator = setupIndicator(forTarget: overlay)
        indicator.startAnimating()
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.4
        UIView.commitAnimations()
        
        screenOverlay = overlay
    }
    
    fileprivate func hideIndicator() {
        screenOverlay?.removeFromSuperview()
        screenOverlay = nil
    }
    
    fileprivate func setupOverlay() -> UIView {
        let overlay = UIView()
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black
        overlay.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(overlay)
        view.bringSubviewToFront(overlay)
        overlay.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        return overlay
    }
    
    fileprivate func setupIndicator(forTarget target: UIView) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        target.addSubview(indicator)
        indicator.centerXAnchor.constraint(equalTo: target.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: target.centerYAnchor).isActive = true
        return indicator
    }
}

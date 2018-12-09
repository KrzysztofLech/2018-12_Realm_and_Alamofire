//
//  ListViewController.swift
//  Netizens
//
//  Created by Krzysztof Lech on 08/12/2018.
//  Copyright © 2018 Krzysztof Lech. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    //MARK: - Outlets

    @IBOutlet private weak var itemsCounterLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private var noDataView: UIView!
    
    // MARK: - Private Properties
    
    private let detailSegue = "DetailSegue"
    private let viewModel = ItemsViewModel()
    
    //MARK: - Life Cycles Methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    //MARK: - Private Methods
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: ItemTableViewCell.toString(), bundle: nil), forCellReuseIdentifier: ItemTableViewCell.toString())
        tableView.backgroundView = noDataView
    }
    
    private func fetchData() {
        viewModel.initFetch { [weak self] in
            guard let itemsCount = self?.viewModel.itemsCount else { return }
            
            self?.tableView.backgroundView = itemsCount > 0 ? nil : self?.noDataView
            self?.itemsCounterLabel.text = String(format: "Items: %i", itemsCount)
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController, let index = sender as? Int {
            vc.item = viewModel.getItemData(withIndex: index)
        }
    }
}

// MARK: - Table View Data Souce Methods

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.toString(), for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        let data = viewModel.getItemData(withIndex: indexPath.row)
        cell.update(withData: data)
        
        // downloading thumbnail image
        ImageService.getImage(withUrl: data.thumbnailUrl) { (image) in
            if cell.thumbnailURL == data.thumbnailUrl {
                cell.activityIndicator.stopAnimating()
                cell.thumbnailImageView.image = image
            }
        }
        
        return cell
    }
    
    // cells animation
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let width = UIScreen.main.bounds.width
        let offset: CGFloat = indexPath.row%2 == 0 ? width : -width
        let transform = CATransform3DTranslate(CATransform3DIdentity, offset, 0, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 0.3, animations: { cell.layer.transform = CATransform3DIdentity })
    }
}

// MARK: - Table View Delegate Method

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: detailSegue, sender: indexPath.row)
    }
}
